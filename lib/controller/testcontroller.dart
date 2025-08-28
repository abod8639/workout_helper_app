// habit_controller.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:workout_helper_app/test/test1.dart';
import 'package:workout_helper_app/test/test2.dart';
import 'package:workout_helper_app/test/test4.dart';

class HabitController extends GetxController {
  final Habitdb db = Habitdb();
  final TextEditingController habitTextController = TextEditingController();
  late final Box myBox;
  Timer? _resetCheckTimer;
  RxInt dayCount = 1.obs;
  Rx<DateTime?> lastResetDate = Rx<DateTime?>(null);
  RxInt index = 0.obs;

  // Map to store habit completion history
  final Rx<Map<String, Map<DateTime, bool>>> habitHistoryMap =
      Rx<Map<String, Map<DateTime, bool>>>({});

  // Status indicators
  final RxBool isInitialized = false.obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeAsync();
  }

  /// Initialize the controller asynchronously
  Future<void> _initializeAsync() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Get the Hive box
      myBox = Hive.box(HabitStorage.boxName);

      // Initialize the database and load data
      await initializeBox(myBox, db);

      // Initialize reactive variables
      _initializeReactiveState();

      // Check for habit reset
      _setupHabitResetChecking();

      isInitialized.value = true;
      debugPrint('✅ HabitController initialized successfully');
    } catch (e) {
      errorMessage.value = 'Failed to initialize: $e';
      debugPrint('❌ Error initializing HabitController: $e');

      // Try to recover
      _attemptRecovery();
    } finally {
      isLoading.value = false;
    }
  }

  /// Initialize reactive state variables
  void _initializeReactiveState() {
    // Load day count with a default value if not found
    dayCount.value =
        myBox.get(HabitStorage.dayCountKey) ?? HabitStorage.defaultDayCount;

    // Load last reset date
    lastResetDate.value = getLastResetDate(myBox);

    // Load habit history
    _loadHabitHistory();
  }

  /// Set up periodic checking for habit resets
  void _setupHabitResetChecking() {
    // Check immediately on startup
    // checkAndResetHabits();

    // // Then check periodically
    // _resetCheckTimer?.cancel(); // Cancel any existing timer
    // _resetCheckTimer = Timer.periodic(
    //   const Duration(minutes: 15),
    //   (_) => checkAndResetHabits(),
    // );

    debugPrint('🔄 Habit reset checking schedule established');
  }

  /// Attempt recovery from initialization errors
  void _attemptRecovery() {
    try {
      // Attempt to initialize with default values
      dayCount.value = HabitStorage.defaultDayCount;
      lastResetDate.value = DateTime.now();
      saveLastResetDate(myBox, lastResetDate.value!);

      // Create default data
      db.createDefaultData();

      // Set up checking
      _setupHabitResetChecking();

      isInitialized.value = true;
      debugPrint('🔄 Recovery successful');
    } catch (e) {
      debugPrint('❌ Recovery failed: $e');
      errorMessage.value = 'Recovery failed: $e';
    }
  }

  void incrementDayCount() {
    dayCount.value++;
    myBox.put(HabitStorage.dayCountKey, dayCount.value);
  }

  /// Load habit history from storage
  void _loadHabitHistory() {
    try {
      final Map<String, Map<DateTime, bool>> history = {};
      final habits = db.todaysHabitList;
      final startDate = createDateTimeObject(getStartDay());
      final today = DateTime.now();

      for (var habit in habits) {
        final String habitName = habit[0];
        final Map<DateTime, bool> habitData = {};

        for (
          var date = startDate;
          date.isBefore(today) || date.isAtSameMomentAs(today);
          date = date.add(const Duration(days: 1))
        ) {
          final normalizedDate = DateTime(date.year, date.month, date.day);
          final String formattedDate = convertDateTimeToString(normalizedDate);
          final String historyKey = "${habitName}_$formattedDate";
          final bool? completed = myBox.get(historyKey);
          if (completed != null) {
            habitData[normalizedDate] = completed;
          }
        }

        history[habitName] = habitData;
      }

      habitHistoryMap.value = history;
      debugPrint('📊 Loaded history for ${history.length} habits');
    } catch (e) {
      debugPrint('❌ Error loading habit history: $e');
      habitHistoryMap.value = {};
    }
  }

  @override
  void onClose() {
    _resetCheckTimer?.cancel();
    habitTextController.dispose();
    super.onClose();
  }

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000.0;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600.0 &&
      MediaQuery.of(context).size.width < 1000.0;
  bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < 600.0;

  String getStartDay() {
    return myBox.get(HabitStorage.startDayKey, defaultValue: "");
  }
}
