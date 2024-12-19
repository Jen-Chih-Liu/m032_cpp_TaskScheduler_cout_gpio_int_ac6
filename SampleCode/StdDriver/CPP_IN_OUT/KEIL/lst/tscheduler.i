# 1 "../TaskScheduler-master/src/TScheduler.hpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 414 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../TaskScheduler-master/src/TScheduler.hpp" 2
# 15 "../TaskScheduler-master/src/TScheduler.hpp"
namespace TS{
# 1 "../TaskScheduler-master/src\\TaskScheduler.h" 1
# 260 "../TaskScheduler-master/src\\TaskScheduler.h"
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
# 261 "../TaskScheduler-master/src\\TaskScheduler.h" 2
# 330 "../TaskScheduler-master/src\\TaskScheduler.h"
static uint32_t _task_millis() {return millis();}
# 349 "../TaskScheduler-master/src\\TaskScheduler.h"
Task::Task( unsigned long aInterval, long aIterations, TaskCallback aCallback, Scheduler* aScheduler, bool aEnable, TaskOnEnable aOnEnable, TaskOnDisable aOnDisable



  ) {

    reset();
    set(aInterval, aIterations, aCallback, aOnEnable, aOnDisable);






    if (aScheduler) aScheduler->addTask(*this);





    if (aEnable) enable();
}





Task::~Task() {
    if ( this->isEnabled() ) disable();
    if (iScheduler) iScheduler->deleteTask(*this);
}
# 512 "../TaskScheduler-master/src\\TaskScheduler.h"
bool Task::isEnabled() { return iStatus.enabled; }

unsigned long Task::getInterval() { return iInterval; }

long Task::getIterations() { return iIterations; }

unsigned long Task::getRunCounter() { return iRunCounter; }
# 528 "../TaskScheduler-master/src\\TaskScheduler.h"
void Task::setCallback(TaskCallback aCallback) { iCallback = aCallback; }
void Task::setOnEnable(TaskOnEnable aCallback) { iOnEnable = aCallback; }
void Task::setOnDisable(TaskOnDisable aCallback) { iOnDisable = aCallback; }
# 539 "../TaskScheduler-master/src\\TaskScheduler.h"
void Task::reset() {





    iStatus.enabled = false;
    iStatus.inonenable = false;
    iStatus.canceled = false;
    iPreviousMillis = 0;
    iInterval = 0;
    iDelay = 0;
    iPrev = 0;
    iNext = 0;
    iScheduler = 0;
    iRunCounter = 0;
# 593 "../TaskScheduler-master/src\\TaskScheduler.h"
}
# 606 "../TaskScheduler-master/src\\TaskScheduler.h"
void Task::set(unsigned long aInterval, long aIterations, TaskCallback aCallback, TaskOnEnable aOnEnable, TaskOnDisable aOnDisable) {




    iCallback = aCallback;
    iOnEnable = aOnEnable;
    iOnDisable = aOnDisable;
# 625 "../TaskScheduler-master/src\\TaskScheduler.h"
    setInterval(aInterval);
    iSetIterations = iIterations = aIterations;




}





void Task::setIterations(long aIterations) {




    iSetIterations = iIterations = aIterations;




}






void Task::yield (TaskCallback aCallback) {




    iCallback = aCallback;
    forceNextIteration();




    iRunCounter = iRunCounter - 1;
    if ( iIterations >= 0 ) iIterations = iIterations + 1;




}




void Task::yieldOnce (TaskCallback aCallback) {




    yield(aCallback);
    iIterations = 1;




}







bool Task::enable() {
    if (iScheduler) {





        iRunCounter = 0;
        iStatus.canceled = false;
# 719 "../TaskScheduler-master/src\\TaskScheduler.h"
        if ( iOnEnable && !iStatus.inonenable ) {
            Task *current = iScheduler->iCurrent;
            iScheduler->iCurrent = this;
            iStatus.inonenable = true;
            iStatus.enabled = iOnEnable();
            iStatus.inonenable = false;
            iScheduler->iCurrent = current;
        }
        else {
            iStatus.enabled = true;
        }


        iDelay = iInterval;
        iPreviousMillis = _task_millis() - iDelay;
# 749 "../TaskScheduler-master/src\\TaskScheduler.h"
        return iStatus.enabled;
    }
    return false;
}




bool Task::enableIfNot() {




    bool previousEnabled = iStatus.enabled;
    if ( !previousEnabled ) enable();





    return (previousEnabled);
}




bool Task::enableDelayed(unsigned long aDelay) {




    enable();
    delay(aDelay);





    return iStatus.enabled;
}
# 840 "../TaskScheduler-master/src\\TaskScheduler.h"
void Task::delay(unsigned long aDelay) {




    iDelay = aDelay ? aDelay : iInterval;
    iPreviousMillis = _task_millis();




}



void Task::adjust(long aInterval) {
    if ( aInterval == 0 ) return;





    if ( aInterval < 0 ) {
      iPreviousMillis = iPreviousMillis + aInterval;
    }
    else {
      iDelay = iDelay + aInterval;

    }



}






void Task::forceNextIteration() {




    iDelay = iInterval;
    iPreviousMillis = _task_millis() - iDelay;




}






void Task::setInterval (unsigned long aInterval) {




    iInterval = aInterval;
    delay();




}






void Task::setIntervalNodelay (unsigned long aInterval, unsigned int aOption) {
# 924 "../TaskScheduler-master/src\\TaskScheduler.h"
    switch (aOption) {
      case 1:
      {
          int32_t d = aInterval - iInterval;

          iDelay = iDelay + d;
          iInterval = aInterval;
          break;
      }
      case 2:
          iInterval = aInterval;
          iDelay = aInterval;
          break;

      default:

          if ( iInterval == iDelay ) {
              iInterval = aInterval;
              iDelay = aInterval;
          }
          else {
              iInterval = aInterval;
          }
          break;
    }




}






bool Task::disable() {
    bool previousEnabled = iStatus.enabled;
    iStatus.enabled = false;
    iStatus.inonenable = false;




    if (previousEnabled && iOnDisable) {


        Task *current = iScheduler->iCurrent;
        iScheduler->iCurrent = this;



        iOnDisable();


        iScheduler->iCurrent = current;
    }







    return (previousEnabled);
}




void Task::abort() {
    iStatus.enabled = false;
    iStatus.inonenable = false;
    iStatus.canceled = true;







}





void Task::cancel() {
    iStatus.canceled = true;



    disable();
}

bool Task::canceled() {
    return iStatus.canceled;
}





bool Task::restart() {
    iIterations = iSetIterations;
    return enable();
}




bool Task::restartDelayed(unsigned long aDelay) {
    iIterations = iSetIterations;
    return enableDelayed(aDelay);
}

bool Task::isFirstIteration() { return (iRunCounter <= 1); }

bool Task::isLastIteration() { return (iIterations == 0); }
# 1073 "../TaskScheduler-master/src\\TaskScheduler.h"
Scheduler::Scheduler() {
    init();



}
# 1089 "../TaskScheduler-master/src\\TaskScheduler.h"
void Scheduler::init() {
    iEnabled = false;

    iFirst = 0;
    iLast = 0;
    iCurrent = 0;

    iPaused = false;
# 1110 "../TaskScheduler-master/src\\TaskScheduler.h"
    iEnabled = true;
}





 void Scheduler::addTask(Task& aTask) {


    if (aTask.iScheduler != 0)
        return;

    iEnabled = false;

    aTask.iScheduler = this;

    if (iFirst == 0) {
        iFirst = &aTask;
        aTask.iPrev = 0;
    }
    else {

        aTask.iPrev = iLast;
        iLast->iNext = &aTask;
    }

    aTask.iNext = 0;
    iLast = &aTask;

    iEnabled = true;
}




void Scheduler::deleteTask(Task& aTask) {

    if (aTask.iScheduler != this)
        return;

    iEnabled = false;

    aTask.iScheduler = 0;
    if (aTask.iPrev == 0) {
        if (aTask.iNext == 0) {
            iFirst = 0;
            iLast = 0;
            iEnabled = true;
            return;
        }
        else {
            aTask.iNext->iPrev = 0;
            iFirst = aTask.iNext;
            aTask.iNext = 0;
            iEnabled = true;
            return;
        }
    }

    if (aTask.iNext == 0) {
        aTask.iPrev->iNext = 0;
        iLast = aTask.iPrev;
        aTask.iPrev = 0;
        iEnabled = true;
        return;
    }

    aTask.iPrev->iNext = aTask.iNext;
    aTask.iNext->iPrev = aTask.iPrev;
    aTask.iPrev = 0;
    aTask.iNext = 0;

    iEnabled = true;
}
# 1194 "../TaskScheduler-master/src\\TaskScheduler.h"
void Scheduler::disableAll() {


    iEnabled = false;

    Task* current = iFirst;
    Task* next;
    while (current) {
        next = current->iNext;
        current->disable();



        current = next;
    }





    iEnabled = true;
}
# 1224 "../TaskScheduler-master/src\\TaskScheduler.h"
void Scheduler::enableAll() {


    iEnabled = false;

    Task *current = iFirst;
    while (current) {
        current->enable();
        current = current->iNext;
    }





    iEnabled = true;
}
# 1269 "../TaskScheduler-master/src\\TaskScheduler.h"
void Scheduler::startNow() {

    unsigned long t = _task_millis();

    iEnabled = false;

    iCurrent = iFirst;
    while (iCurrent) {
        if ( iCurrent->iStatus.enabled ) iCurrent->iPreviousMillis = t - iCurrent->iDelay;
        iCurrent = iCurrent->iNext;
    }





    iEnabled = true;
}





long Scheduler::timeUntilNextIteration(Task& aTask) {







    if ( !aTask.isEnabled() )
        return (-1);

    long d = (long) aTask.iDelay - ( (long) (_task_millis() - aTask.iPreviousMillis) );

    if ( d < 0 )
        return (0);
    return ( d );
}


Task& Scheduler::currentTask() { return *iCurrent; }
Task* Scheduler::getCurrentTask() { return iCurrent; }
# 1351 "../TaskScheduler-master/src\\TaskScheduler.h"
bool Scheduler::execute() {

    bool idleRun = true;
    unsigned long m, i;
# 1368 "../TaskScheduler-master/src\\TaskScheduler.h"
    Task *nextTask;
    iCurrent = iFirst;

    iActiveTasks = 0;
    iTotalTasks = 0;
    iInvokedTasks = 0;
# 1384 "../TaskScheduler-master/src\\TaskScheduler.h"
    if ( !iEnabled ) return true;
# 1397 "../TaskScheduler-master/src\\TaskScheduler.h"
    while (!iPaused && iCurrent) {

        iTotalTasks++;
# 1411 "../TaskScheduler-master/src\\TaskScheduler.h"
        nextTask = iCurrent->iNext;
        do {
            if ( iCurrent->iStatus.enabled ) {
                iActiveTasks++;
# 1428 "../TaskScheduler-master/src\\TaskScheduler.h"
                if (iCurrent->iIterations == 0) {
                    iCurrent->disable();



                    break;
                }
                m = _task_millis();
                i = iCurrent->iInterval;
# 1487 "../TaskScheduler-master/src\\TaskScheduler.h"
                if ( m - iCurrent->iPreviousMillis < iCurrent->iDelay ) {
# 1500 "../TaskScheduler-master/src\\TaskScheduler.h"
                    break;
                }






                if ( iCurrent->iIterations > 0 ) iCurrent->iIterations = iCurrent->iIterations - 1;
                iCurrent->iRunCounter = iCurrent->iRunCounter + 1;
# 1531 "../TaskScheduler-master/src\\TaskScheduler.h"
                iCurrent->iPreviousMillis = iCurrent->iPreviousMillis + iCurrent->iDelay;
# 1542 "../TaskScheduler-master/src\\TaskScheduler.h"
                iCurrent->iDelay = i;
# 1551 "../TaskScheduler-master/src\\TaskScheduler.h"
                if ( iCurrent->iCallback ) {
                    iCurrent->iCallback();
                    idleRun = false;
                    iInvokedTasks++;
                }






            }



        } while (0);

        iCurrent = nextTask;
# 1580 "../TaskScheduler-master/src\\TaskScheduler.h"
    }
# 1622 "../TaskScheduler-master/src\\TaskScheduler.h"
    return (idleRun);
}
# 17 "../TaskScheduler-master/src/TScheduler.hpp" 2
}

using TsScheduler = TS::Scheduler;
using TsTask = TS::Task;






using TsTaskCallback = TS::TaskCallback;
using TsTaskOnDisable = TS::TaskOnDisable;
using TsTaskOnEnable = TS::TaskOnEnable;
