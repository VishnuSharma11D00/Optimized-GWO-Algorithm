# gwo-algorythm
Improved version of Grew Wolf Optimizer Algorythm
Grey wolf optimizer (GWO) is a population-based meta-heuristics algorithm that simulates the leadership hierarchy and hunting mechanism of grey wolves in nature, and it’s proposed by Seyedali Mirjalili et al. in 2014. 

Grey wolves are considered apex predators, which are at the top of the food chain. Grey wolves prefer to live in groups (packs), each group contain 5-12 individuals on average.
1. Alpha α wolf is considered the dominant wolf in the pack and his/her orders should be followed by the pack members.
2. Beta β are subordinate wolves, which help the alpha in decision-making and are considered as the best candidate to be the alpha.
3. Delta δ wolves have to submit to the alpha and beta, but they dominate the omega. There are different categories of delta-like Scouts, Sentinels, Elders, Hunters, Caretakers etc.
4. Omega ω wolves are considered as the scapegoat in the pack, are the least important individuals in the pack and are only allowed to eat at last.

Social hierarchy: 
  - The Fittest solution as an Alpha wolf (α)
  - Second best solution as a Beta wolf (β)
  - Third best solution as a Delta wolf (δ)
  - Rest of the candidate solutions as Omega wolves (ω)
 
# Repo explanation
Above are the code files and Graphs to run the Improved GWO algorithm.
The **GWO.zip** folder is the **orginal grey-wolf algorithm**. It is easily available on the internet as well. I have provided it for your reference.

## Prerequisite
  Matlab

    
#### Here's a detailed comparison and explanation of the changes and enhancements:

## Original Code:
  1. Initialization:
     - The positions of the search agents are initialized.
     - Alpha, Beta, and Delta wolves are initialized.
  2. Main Loop:
    - For each agent, check if the position is within bounds.
    - Evaluate the fitness of each agent.
    - Update Alpha, Beta, and Delta wolves based on fitness.
    - Update the positions of the search agents based on the positions of Alpha, Beta, and Delta wolves.
    - Update the convergence curve with the current best fitness value.
## Modified Code:
  1. Initialization:
     - The positions of the search agents are initialized as in the original code.
     - Separate variables for "best" Alpha, Beta, and Delta positions and scores are introduced.
  2. Main Loop (First Pass):
     - Similar to the original loop, but additionally stores the positions of the Alpha wolf in a new variable **predator_B**.
  3. New Loop (Second Pass):
     - This new loop runs another optimization process starting from the positions of the best Alpha wolf found in the first pass.
     - The same process of boundary checking, fitness evaluation, and position updates is followed.
  4. Comparison and Final Update:
     - After both passes, the code compares the final scores from both passes.
     - The best results from either pass are chosen as the final output.

## Improvements:
  1. Double Optimization Loop:
     - The addition of a second loop that starts from the best positions found in the first loop adds an additional layer of refinement, potentially leading to better solutions.
  2. Separate Tracking of Best Scores:
     - By maintaining separate best scores and positions (Alpha_score_b, Beta_score_b, etc.), the algorithm can more effectively track and update the best solutions found during the second pass.
  3. Enhanced Convergence:
     - The comparison at the end ensures that the best possible score from both optimization passes is chosen, enhancing the overall convergence of the algorithm.

## Technical Details:
  1. Initialization:
     - The positions of the search agents are initialized using a helper function.
     - Both the current and "best" positions and scores for Alpha, Beta, and Delta wolves are initialized.
  2. Boundary Checking:
     - Positions that go beyond the search space boundaries are adjusted.
  3. Fitness Evaluation:
     - The objective function is evaluated for each agent.
     - The Alpha, Beta, and Delta wolves are updated based on the fitness values.
  4. Position Update:
     - The positions of the search agents are updated based on the equations of the GWO algorithm.
  5. Convergence Tracking:
     - The convergence curve is updated with the current best score in each iteration.

# Code Comparison:
The modified code adds complexity and additional steps for potentially better optimization, while the original code is simpler and performs a single pass optimization. The trade-off is between complexity and potentially improved results.

By introducing a second optimization phase starting from the best positions of the first phase, the modified code aims to enhance the solution quality. This approach can be especially useful in cases where the search space is complex, and a single pass might not suffice to find the optimal solution.
