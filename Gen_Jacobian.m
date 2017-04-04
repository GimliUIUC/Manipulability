        %%%generate 2 link hopping leg
        %%%Author: Yanran Ding
        syms q1 q2 real
        syms L1 L2 real

        
        q = [q1 q2];



        params_list = {
            'L1', 'params(1)';
            'L2', 'params(2)'};     

        data = {} ;
        for j=1:length(params)
            data(j,1) = params(j,1) ;
            data(j,2) = {['params(' num2str(j) ')']} ;
        end

        m_list_params = data;


%% forward kinematics
        %counterclockwise rotation matrix for [x;z] vectors 
        rot = @(th)[cos(th) -sin(th); sin(th) cos(th)];
        
        p1_COM = [x;z];
        p1 = p1_COM + rot(q1)*[0;L1/2];
        p0 = p1_COM - rot(q1)*[0;L1/2];
        
        M = M1;
        p_COM = M1/M*(p1_COM);
%% Velocity kinematics
        v1_COM = jacobian(p1_COM,q)*dq';

%% Kinetic Energy, Potential Energy, and Lagrangian
        KE_1 = 0.5*M1*v1_COM.'*v1_COM+0.5*J1*dq1^2;
        
        KE = KE_1;

        PE = g*(M1*p1_COM(2));

        Upsilon = []; % where control torques go

        
%         dJP1 = sym('dJP1',size(JP1));
%         for ii = 1:size(JP1,2)
%             dJP1(:,ii) = jacobian(JP1(:,ii),q)*dq';
%         end
        
        
% %% Holonomic Constraints
%         h0 = p0;
%         h5 = p5;
%         Jh0 = jacobian(h0,q);
%         Jh5 = jacobian(h5,q);
%         dJh0 = sym('dJh0',size(Jh0));
%         dJh5 = sym('dJh5',size(Jh5));
%         for ii=1:size(Jh0,2)
%             dJh0(:,ii) = jacobian(Jh0(:,ii),q)*dq';
%             dJh5(:,ii) = jacobian(Jh5(:,ii),q)*dq';
%         end
        
%% Euler-Lagrange Equation
        [D, C, G, B] = std_dynamics(KE,PE,q,dq, Upsilon);
          
        m_output_dir = pwd;
        write_fcn_m([m_output_dir '\fcn_D.m'],{'q', 'params'},[m_list_q_stance;m_list_params],{D,'D'});
        write_fcn_m([m_output_dir '\fcn_C.m'],{'q','dq', 'params'},[m_list_q_stance;m_list_dq_stance;m_list_params],{C,'C'});
        write_fcn_m([m_output_dir '\fcn_G.m'],{'q', 'params'},[m_list_q_stance;m_list_params],{G,'G'});
        write_fcn_m([m_output_dir '\fcn_B.m'],{'q', 'params'},[m_list_q_stance;m_list_params],{B,'B'});
        write_fcn_m([m_output_dir '\fcn_p0.m'],{'q', 'params'},[m_list_q_stance;m_list_params],{p0,'p0'});
        write_fcn_m([m_output_dir '\fcn_p1.m'],{'q', 'params'},[m_list_q_stance;m_list_params],{p1,'p1'});

        
        