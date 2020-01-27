# Metaheuristic algorithms used to solve Traveling Salesman Problem

Project includes console application that compares time and quality of two algorithms - Tabu Search and Simulated Annealing.

## Running the tests

To run the program, download the project, open in terminal, compile it using command ```make``` and run ```./TSP```

## Tabu Search

Algorithm is tested using three proximity definitions 
* ```swap(i, j)``` : swaps element at position i with element at position j
* ```insert(i, j)``` : moves element from position j to position i
* ```invert(i, j)``` : reverses array from element i to element j

## Simulated Annealing

Starting temperature is defined as cost of starting path multiplied by 10.

Cooling function is implemented by a formula 
```
T(i+1) = a * T(i)
```
In tests, cooling factor ```a``` was equal to 
* 0.99
* 0.95
* 0.85

Probability function depends on current temperature ```T```, cost of the best solution found so far ```C``` and cost of new solution ```C'```
```
P = exp((C'-C)/T)
```

## Measurements

Report includes testing algorithms on 3 files with a specified time limit:
* ftv47 - 47 cities, 30 seconds
* ftv170 - 170 cities, 120 seconds
* rbg403 - 403 cities, 240 seconds

Each algorithm was repeated 10 times for each definition of proximity or cooling factor, and results (cost of best solution found, time of discovery and relative error) are stored in tables.