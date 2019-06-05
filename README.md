# Scheduling
Scheduling daily surgery rooms for operations of the next day in between hours of 9:00 am and 5:00 pm. Dataset includes 20 operations with their possible starting and ending times, durations and the priority of each patient. According to several constraints:
 - There are 4 number of daily surgery rooms in the hospital, and the operations should be placed only in these rooms.
 - The number of doctors is enough to serve the patients.
 - The time horizon is between 9:00 and 17:00. This interval is taken as [0, 480]. Data provided covers this interval.
 - There is a priority level given to each operation and it is represented by a 4-level integer value as 1, 2, 3 and 4. While Level-1 denotes the highest priority, Level4 denotes the least priority.
 - The operations have to take place in the available interval. For instance, if an available interval for an operation is (0,30), and its duration is 10 minutes, then it cannot start at the 21st minute, since the end of the operation exceeds the time interval.
 - Suppose you have two operations which have available intervals as (0,20) and each takes 10 minutes to operate. Then, the one with the highest priority should be done before the other.
 - The operations in the same room cannot overlap.
 - The durations of the operations are known to be certain. So, there is no earliness or delay in an operation.
 - There will always be a feasible schedule for each operation. So, the algorithm should place all the operations according to the constraints.

Below image is a summary of the classes, showing what properties and methods should be available in each class. 
![classes](https://user-images.githubusercontent.com/30045618/58820467-5d6b0d00-863b-11e9-90f9-d7120255bfa1.JPG)

While scheduling the operations into 4 rooms, the first precedence is given to priorities of the patients. In the hospital, the operation having the highest priority should be done before the others with respect to its available starting and ending times. It is important to do the operation with highest priority before the others and also without keeping patients waiting. For example, if there are operations with duration of 20 minutes and 30 minutes, and available interval of (0, 40) and (0, 60) respectively. In addition, both operation have the priority of one. If the first operation is done in room 1 in the interval of (0, 20), the second one should not be done in (20, 50) interval in room 1. Instead, it should be done in room 2 in the time interval of (0, 30). Moreover, using the rooms in a fairly or in order is not precedence, which means that it is not required to assign the operations in rooms fairly or it is not important to use the rooms in an orderly way.

Algorithm has produced the following schedule:

| Room number   | Available Interval	| Duration (min)	| Scheduled Interval	| Patient Name		| Patient Surname		| Patient Priority 	 |
| -----	        | ----- 		| -----			| ----- 		| -----			| -----				| -----			 |
| 1	        | (0 , 40)		| 20			| (0 , 20)		| Justin		| Bieber			| 1			 |
| 1		| (360 , 480)		| 120			| (360 , 480)		| Yýlmaz		| Morgul			| 1			 |
| 1		| (40 , 180)		| 40			| (40 , 80)		| Heidi			| Klum				| 1			 |
| 2		| (0 , 180)		| 60			| (0 , 60)		| Bihter		| Ziyagil			| 1			 |
| 1		| (120 , 380)		| 120			| (120 , 240)		| Husnu			| Coban				| 1			 |
| 2		| (60 , 360)		| 20			| (60 , 80)		| Sezen			| Aksu				| 1			 |
| 3		| (0 , 480)		| 40			| (0 , 40)		| Serdar		| Ortac				| 1			 |
| 3		| (40 , 120)		| 60			| (40 , 100)		| Selena		| Gomez				| 2			 |
| 4		| (0 , 120)		| 60			| (0 , 60)		| Patricia 		| Petibon			| 2			 |
| 4		| (0 , 140)		| 40			| (60 , 100)		| Isabella 		| Boylston			| 2			 |
| 2		| (200 , 360)		| 40			| (200 , 240)		| Hadise		| Acikgoz			| 2			 |
| 2		| (100 , 180)		| 40			| (100 , 140)		| Nihal			| Candan			| 3			 |
| 1		| (240 , 360)		| 40			| (240 , 280)		| Askim			| Kapismak			| 3			 |
| 3		| (180 , 320)		| 60			| (180 , 240)		| Ýbrahim		| Tatlýses			| 3			 |
| 3		| (40 , 240)		| 60			| (100 , 160)		| Safiye		| Soyman			| 3			 |
| 1		| (0 , 120)		| 20			| (20 , 40)		| Kendall		| Jenner			| 4			 |
| 4		| (120 , 300)		| 100			| (120 , 220)		| Murat			| Kekilli			| 4			 |
| 2		| (260 , 480)		| 60			| (260 , 320)		| Aurelie		| Dupont			| 4			 |
| 4		| (40 , 360)		| 100			| (220 , 320)		| Faik			| Ozturk			| 4			 |
| 3		| (0 , 480)		| 180			| (240 , 420)		| Bruce			| Jenner			| 4			 |

Gantt chart of surgery rooms can be seen from figure below:
![gant](https://user-images.githubusercontent.com/30045618/58962099-20c22180-87b3-11e9-90bc-3bbd8989e833.png)

All in all, an algorithm is constructed by taking care of priorities of operations and paying attention not to keep any patient waiting or as less as possible. In the final schedule, all patients have an operation on their available interval time and according to their priories.


