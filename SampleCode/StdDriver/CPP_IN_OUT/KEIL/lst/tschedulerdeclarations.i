# 1 "../TaskScheduler-master/src/TSchedulerDeclarations.hpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 441 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../TaskScheduler-master/src/TSchedulerDeclarations.hpp" 2
# 15 "../TaskScheduler-master/src/TSchedulerDeclarations.hpp"
namespace TS{
# 1 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h" 1



# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stddef.h" 1 3
# 39 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stddef.h" 3
# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\__config" 1 3
# 20 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\__config" 3
# 40 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stddef.h" 2 3
# 43 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stddef.h" 3



# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stddef.h" 1 3
# 28 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stddef.h" 3
        namespace std {

        extern "C" {







  typedef signed int ptrdiff_t;







    typedef unsigned int size_t;
# 95 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stddef.h" 3
  typedef long double max_align_t;



         }
      }






      using ::std::size_t;
      using ::std::ptrdiff_t;

        using ::std::max_align_t;
# 47 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stddef.h" 2 3



typedef decltype(nullptr) nullptr_t;
# 5 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h" 2
# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stdint.h" 1 3
# 110 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stdint.h" 3
# 124 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stdint.h" 3
# 1 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 1 3
# 40 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 3
      namespace std {

          extern "C" {
# 56 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 259 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 3
         }
      }





      using ::std::int8_t;
      using ::std::int16_t;
      using ::std::int32_t;
      using ::std::int64_t;
      using ::std::uint8_t;
      using ::std::uint16_t;
      using ::std::uint32_t;
      using ::std::uint64_t;
      using ::std::int_least8_t;
      using ::std::int_least16_t;
      using ::std::int_least32_t;
      using ::std::int_least64_t;
      using ::std::uint_least8_t;
      using ::std::uint_least16_t;
      using ::std::uint_least32_t;
      using ::std::uint_least64_t;
      using ::std::int_fast8_t;
      using ::std::int_fast16_t;
      using ::std::int_fast32_t;
      using ::std::int_fast64_t;
      using ::std::uint_fast8_t;
      using ::std::uint_fast16_t;
      using ::std::uint_fast32_t;
      using ::std::uint_fast64_t;
      using ::std::intptr_t;
      using ::std::uintptr_t;
      using ::std::intmax_t;
      using ::std::uintmax_t;
# 125 "C:\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\libcxx\\stdint.h" 2 3
# 6 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h" 2
# 35 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
class Scheduler;
# 149 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
typedef void (*TaskCallback)();
typedef void (*TaskOnDisable)();
typedef bool (*TaskOnEnable)();
# 162 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
typedef struct {
    bool enabled : 1;
    bool inonenable : 1;
    bool canceled : 1;
# 177 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
} __task_status;


class Task {
  friend class Scheduler;
  public:
# 192 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
           Task(unsigned long aInterval=0, long aIterations=0, TaskCallback aCallback=0, Scheduler* aScheduler=0, bool aEnable=false, TaskOnEnable aOnEnable=0, TaskOnDisable aOnDisable=0



  );
# 211 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
    virtual ~Task();
# 221 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
           bool enable();
           bool enableIfNot();
           bool enableDelayed(unsigned long aDelay=0);
           bool restart();
           bool restartDelayed(unsigned long aDelay=0);

           void delay(unsigned long aDelay=0);
           void adjust(long aInterval);
           void forceNextIteration();
           bool disable();
           void abort();
           void cancel();
           bool isEnabled();
           bool canceled();
# 244 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
           void set(unsigned long aInterval, long aIterations, TaskCallback aCallback,TaskOnEnable aOnEnable=0, TaskOnDisable aOnDisable=0);

           void setInterval(unsigned long aInterval);
           void setIntervalNodelay(unsigned long aInterval, unsigned int aOption = 0);
           unsigned long getInterval();
           void setIterations(long aIterations);
           long getIterations();
           unsigned long getRunCounter();
# 263 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
           void setCallback(TaskCallback aCallback) ;
           void setOnEnable(TaskOnEnable aCallback) ;
           void setOnDisable(TaskOnDisable aCallback) ;
           void yield(TaskCallback aCallback);
           void yieldOnce(TaskCallback aCallback);


           bool isFirstIteration() ;
           bool isLastIteration() ;
# 303 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
  private:
           void reset();

    volatile __task_status iStatus;
    volatile unsigned long iInterval;
    volatile unsigned long iDelay;
    volatile unsigned long iPreviousMillis;
# 320 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
    volatile long iIterations;
    long iSetIterations;
    unsigned long iRunCounter;


    TaskCallback iCallback;
    TaskOnEnable iOnEnable;
    TaskOnDisable iOnDisable;


    Task *iPrev, *iNext;
    Scheduler *iScheduler;
# 356 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
};

class Scheduler {
  friend class Task;
  public:
           Scheduler();

           void init();
           void addTask(Task& aTask);
           void deleteTask(Task& aTask);
           void pause() { iPaused = true; };
           void resume() { iPaused = false; };
           void enable() { iEnabled = true; };
           void disable() { iEnabled = false; };





           void disableAll();
           void enableAll();
           void startNow();


           bool execute();

           Task& currentTask() ;
           Task* getCurrentTask() ;
           long timeUntilNextIteration(Task& aTask);

           unsigned long getActiveTasks() { return iActiveTasks; }
           unsigned long getTotalTasks() { return iTotalTasks; }
           unsigned long getInvokedTasks() { return iInvokedTasks; }
# 420 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
  private:
    Task *iFirst, *iLast, *iCurrent;

    volatile bool iPaused, iEnabled;
    unsigned long iActiveTasks;
    unsigned long iTotalTasks;
    unsigned long iInvokedTasks;
# 445 "../TaskScheduler-master/src\\TaskSchedulerDeclarations.h"
};
# 17 "../TaskScheduler-master/src/TSchedulerDeclarations.hpp" 2
}

using TsScheduler = TS::Scheduler;
using TsTask = TS::Task;






using TsTaskCallback = TS::TaskCallback;
using TsTaskOnDisable = TS::TaskOnDisable;
using TsTaskOnEnable = TS::TaskOnEnable;
