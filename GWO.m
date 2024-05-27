
% Grey Wolf Optimizer
function [Alpha_score_b,Alpha_pos_b,Convergence_curve_b]= GWO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

%SearchAgents_no=30; % Number of search agents

%Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

%Max_iter=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
 %[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

% initialize alpha, beta, and delta_pos
Alpha_pos=zeros(1,dim);
Alpha_score= inf; %change this to -inf for maximization problems

Alpha_pos_b=zeros(1,dim);
Alpha_score_b = inf;

Beta_pos=zeros(1,dim);
Beta_score= inf; %change this to -inf for maximization problems

Beta_pos_b=zeros(1,dim);
Beta_score_b = inf;

Delta_pos=zeros(1,dim);
Delta_score= inf; %change this to -inf for maximization problems

Delta_pos_b=zeros(1,dim);
Delta_score_b= inf;

%Initialize the positions of search agents
%[Positions,Positions,predator_B]=initialization(SearchAgents_no,dim,ub,lb);
Positions=initialization(SearchAgents_no,dim,ub,lb);


Convergence_curve=zeros(1,Max_iter);

l=0;% Loop counter

% Main loop
while l<Max_iter
    for i=1:size(Positions,1)  
        
       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;               
        
        % Calculate objective function for each search agent
        fitness=fobj(Positions(i,:));
        
        % Update Alpha, Beta, and Delta
        if fitness<Alpha_score 
            Alpha_score=fitness; % Update alpha
            Alpha_pos=Positions(i,:);
        end
        if fitness>Alpha_score && fitness<Beta_score 
            Beta_score=fitness; % Update beta
            Beta_pos=Positions(i,:);
        end
        
        if fitness>Alpha_score && fitness>Beta_score && fitness<Delta_score 
            Delta_score=fitness; % Update delta
            Delta_pos=Positions(i,:);
        end
    end
    a=2-l*((2)/Max_iter); % a decreases linearly fron 2 to 0
    %a=2-(2/exp(Max_iter));
    % Update the Position of search agents including omegas
    for i=1:size(Positions,1)
        for j=1:size(Positions,2)     
                       
            r1=rand(); % r1 is a random number in [0,1]
            r2=rand(); % r2 is a random number in [0,1]
            
            A1=2*a*r1-a; % Equation (3.3)
            C1=2*r2; % Equation (3.4)
            
            D_alpha=abs(C1*Alpha_pos(j)-Positions(i,j)); % Equation (3.5)-part 1
            X1=Alpha_pos(j)-A1*D_alpha; % Equation (3.6)-part 1
                       
            r1=rand();
            r2=rand();
            
            A2=2*a*r1-a; % Equation (3.3)
            C2=2*r2; % Equation (3.4)
            
            D_beta=abs(C2*Beta_pos(j)-Positions(i,j)); % Equation (3.5)-part 2
            X2=Beta_pos(j)-A2*D_beta; % Equation (3.6)-part 2       
            
            r1=rand();
            r2=rand(); 
            
            A3=2*a*r1-a; % Equation (3.3)
            C3=2*r2; % Equation (3.4)
            
            D_delta=abs(C3*Delta_pos(j)-Positions(i,j)); % Equation (3.5)-part 3
            X3=Delta_pos(j)-A3*D_delta; % Equation (3.5)-part 3             
            
            Positions(i,j)=(X1+X2+X3)/3;% Equation (3.7)
            
            predator_B(i,:)=Alpha_pos;
        end    
    end
        l=l+1;    
    Convergence_curve(l)=Alpha_score;
end
        
    
    
    %%for the second matrix
    l=0;
   while l<Max_iter
    for i=1:size(predator_B,1)  
        
       % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub_b=predator_B(i,:)>ub;
        Flag4lb_b=predator_B(i,:)<lb;
        predator_B(i,:)=(predator_B(i,:).*(~(Flag4ub_b+Flag4lb_b)))+ub.*Flag4ub_b+lb.*Flag4lb_b;               
        
        % Calculate objective function for each search agent
        fitness_b=fobj(predator_B(i,:));
        
        % Update Alpha, Beta, and Delta
        if fitness_b<Alpha_score_b 
            Alpha_score_b=fitness_b; % Update alpha
            Alpha_pos_b=predator_B(i,:);
        end
        
        if fitness_b>Alpha_score_b && fitness<Beta_score_b 
            Beta_score_b=fitness_b; % Update beta
            Beta_pos_b=predator_B(i,:);
        end
        
        if fitness_b>Alpha_score_b && fitness_b>Beta_score_b && fitness_b<Delta_score_b 
            Delta_score_b=fitness_b; % Update delta
            Delta_pos_b=predator_B(i,:);
        end
    end
        b=2-1*(2/Max_iter);
        
        % Update the Position of search agents including omegas
    for i=1:size(predator_B,1)
        for j=1:size(predator_B,2)     
                       
            r1=rand(); % r1 is a random number in [0,1]
            r2=rand(); % r2 is a random number in [0,1]
            
            A1_b=2*b*r1-b; % Equation (3.3)
            C1=2*r2; % Equation (3.4)
            
            D_alpha_b=abs(C1*Alpha_pos_b(j)-predator_B(i,j)); % Equation (3.5)-part 1
            X1_b=Alpha_pos_b(j)-A1_b*D_alpha_b; % Equation (3.6)-part 1
                       
            r1=rand();
            r2=rand();
            
            A2_b=2*b*r1-b; % Equation (3.3)
            C2=2*r2; % Equation (3.4)
            
            D_beta_b=abs(C2*Beta_pos_b(j)-predator_B(i,j)); % Equation (3.5)-part 2
            X2_b=Beta_pos_b(j)-A2_b*D_beta_b; % Equation (3.6)-part 2       
            
            r1=rand();
            r2=rand(); 
            
            A3_b=2*b*r1-b; % Equation (3.3)
            C3=2*r2; % Equation (3.4)
            
            D_delta_b=abs(C3*Delta_pos_b(j)-predator_B(i,j)); % Equation (3.5)-part 3
            X3_b=Delta_pos_b(j)-A3*D_delta_b; % Equation (3.5)-part 3             
            
            predator_B(i,j)=(X1_b+X2_b+X3_b)/3;% Equation (3.7)
        end    
    end
    
    l=l+1;
    Convergence_curve_b(l)=Alpha_score_b;
   end
    
if (Alpha_score>=Alpha_score_b)
    Convergence_curve=Convergence_curve_b;
    Alpha_pos=Alpha_pos_b;
    Alpha_score=Alpha_score_b;
end
end




