%GUI created by Laurel--12 hours
%Sarah and Michelle spent 3 hours (each) helping debug

classdef app_police_brutality_GUI_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        ButtonGroup3                matlab.ui.container.ButtonGroup
        ClickonthebuttonstoseeagraphButtonGroup  matlab.ui.container.ButtonGroup
        ShootingsbyRaceButton       matlab.ui.control.RadioButton
        BodycamButton_2             matlab.ui.control.RadioButton
        ThreatLevelRaceButton_4     matlab.ui.control.RadioButton
        FleeingRaceButton           matlab.ui.control.RadioButton
        ShootingLocationsButton_2   matlab.ui.control.RadioButton
        ThreatLevelGeneralButton    matlab.ui.control.RadioButton
        SignsofMentalIllnessButton  matlab.ui.control.RadioButton
        PopulationRaceButton        matlab.ui.control.RadioButton
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function
        function Button4ValueChanged(app, event)
            
        end

        % Button down function: UIFigure
        function UIFigureButtonDown(app, event)
            
        end

        % Callback function
        function ShootingLocationsButtonPushed(app, event)
            
        end

        % Callback function
        function ShootingsbyRaceButtonPushed(app, event)
            % graphs race overall comparison
        end

        % Callback function
        function PlotButtonPushed(app, event)
            
            
        end

        % Selection changed function: 
        % ClickonthebuttonstoseeagraphButtonGroup
        function ClickonthebuttonstoseeagraphButtonGroupSelectionChanged(app, event)
            selectedButton = app.ClickonthebuttonstoseeagraphButtonGroup.SelectedObject;
            load('T.mat');
            date = T(:, 3);
            armed = T(:, 5);
            age = T(:, 6);
            gender = T(:, 7);
            race = T(:, 8);
            city = T(:, 9);
            state = T(:, 10);
            mental_illness = T(:, 11);
            threat_level = T(:, 12);
            flee = T(:, 13);
            body_cam = T(:, 14);
            longitude = T(:, 15);
            latitude = T(:, 16);
            fleecell = table2cell(flee);
            racecell = table2cell(race);
            race_string = string(racecell);
            flee_string = string(fleecell);
            tbl_race = tabulate(racecell);
            threat_level_cl = table2cell(threat_level);
            tbl_threat_level = tabulate(threat_level_cl);
            

            
            
            y1 = cell2mat(tbl_race(:,2));
            y2 = [354; 3606; 1110; 804; 48; 78];
            
            if app.ShootingsbyRaceButton.Value == true
                % pulling numbers from census data when plotting expected # killed
                % calculated multiplying # in csv by percentage of race in US pop
                % percentage of race in US pop was found not in github (why calc was by
                % hand)
                x = categorical({'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'});
                y = horzcat(y1,y2);
                bar(x,y)
                legend('Actual # Killed', 'Expected # Killed')
                xlabel('Race')
                ylabel('Number of Fatalities')
                title('Fatalities by Race')
                
            elseif app.FleeingRaceButton.Value == true
                racecell = table2cell(race);
                fleecell = table2cell(flee);
                race_string = string(racecell);
                flee_string = string(fleecell);
                % separates Black people from other races
                for ii = 1:length(race_string)
                    if race_string(ii) ~= "B";
                        race_string(ii) = "O";
                    end
                end
                black_flee = 0;
                other_flee = 0;
                black_not_flee = 0;
                other_not_flee = 0;
                for k = 1:length(flee_string)
                    if flee_string(k) ~= "Not fleeing" && race_string(k) == "B"
                        black_flee = black_flee + 1;
                    elseif flee_string(k) ~= "Not fleeing" && race_string(k) == "O"
                        other_flee = other_flee + 1;
                    elseif flee_string(k) == "Not fleeing" && race_string(k) == "B"
                        black_not_flee = black_not_flee + 1;
                    elseif flee_string(k) == "Not fleeing" && race_string(k) == "O"
                        other_not_flee = other_not_flee + 1;
                    end
                end
                % bar chart for Black people fleeing vs Other people fleeing
                x = categorical({'Black', 'Other'});
                yes_flee = vertcat(black_flee, other_flee);
                not_flee = vertcat(black_not_flee, other_not_flee);
                y = horzcat(yes_flee, not_flee);
                bar(x,y)
                legend('Flee', 'Not Flee')
                title('Flee vs Not Fleeing Comparison')
                
            elseif app.BodycamButton_2.Value == true
                bodycamcell = table2cell(body_cam);
                tbl_bodycam = tabulate(bodycamcell);
                counter = 0;
                for ii = 1:length(bodycamcell) % xx = 1: length(numlist), numlist = list of bodycam variables
                    string1 = bodycamcell(ii);
                    if strcmp('False', string1)
                        counter = counter + 1; % count number of false
                    else
                        counter = counter + 1; % count number of true
                    end
                end
                % pie chart showing statistical data for body cam
                X = cell2mat(tbl_bodycam(:,2));
                labels = {'No Body Cam', 'Body Cam'};
                pie(X,labels)
                title('Body cams on policemen')
            elseif app.ShootingLocationsButton_2.Value == true
                latitude = T(:, 16);
                longitude = T(:, 15);
                
                % Converting to array format
                lat = table2array(latitude);
                long = table2array(longitude);
                
                % Creating map of United States
                states = geoshape(shaperead('usastatehi', 'UseGeoCoords', true));
                figure
                ax = usamap('conus');
                oceanColor = [.5 .7 .9]; % Setting ocean color to gray
                setm(ax, 'FFaceColor', oceanColor)
                geoshow(states)
                hold off % Keeping original map of United States and allow for overlay of geoscatter
                geoscatter(lat, long, 'r')
            elseif app.ThreatLevelRaceButton_4.Value == true
                racecell = table2cell(race);
                race_string = string(racecell);
                threat_level_string = string(threat_level_cl);
                tbl_threat_level = tabulate(threat_level_cl); % tabulate shows specific numbers from dataset
                tbl_race = tabulate(racecell);
                
                for ii = 1:length(race_string)
                    if race_string(ii) ~= "B"
                        race_string(ii) = "O";
                    end
                end
                
                for jj = 1:length(threat_level_cl)
                    if threat_level_string(jj) ~= "attack"
                        threat_level_string(jj) = "other";
                    end
                end
                
                
                black_threat_attack = 0;
                other_threat_attack = 0;
                black_other_threat = 0;
                other_other_threat = 0;
                for k = 1:length(threat_level_cl)
                    if threat_level_string(k) == "attack" && race_string(k) == "B"
                        black_threat_attack = black_threat_attack + 1;
                    elseif threat_level_string(k) == "attack" && race_string(k) == "O"
                        other_threat_attack= other_threat_attack + 1;
                    elseif threat_level_string(k) == "other" && race_string(k) == "B"
                        black_other_threat = black_other_threat + 1;
                    elseif threat_level_string(k) == "other" && race_string(k) == "O"
                        other_other_threat = other_other_threat + 1;
                    end
                end
                % raw data for Black perceived threat vs perceived threat from Other races
                x = categorical({'Black','Other'});
                attack_threat = vertcat(black_threat_attack, other_threat_attack);
                other_threat = vertcat(black_other_threat,other_other_threat);
                y = horzcat(attack_threat, other_threat);
                bar(x,y)
                legend('Attack', 'Other Threat')
                title('Threat Level Raw Data Comparison')
                
            elseif app.SignsofMentalIllnessButton.Value == true
                T = readtable('fatal-police-shootings-data.csv');
                mental_illness = T(:,11);
                % pie chart for history of mental illness
                mental_illness_cell = table2cell(mental_illness);
                tbl_mental_illness = tabulate(mental_illness_cell);
                X = cell2mat(tbl_mental_illness(:,2));
                labels = {'No Mental Illness', 'Mental Illness'};
                pie3(X,labels)
                title('History of Mental Illness in Victims')
                
                
            elseif app.ThreatLevelGeneralButton.Value == true
                load('T.mat');
                race = T(:, 8);
                threat_level_clean = table2cell(threat_level);
                idx = strcmp(threat_level_clean,'undetermined');
                threat_level_clean(idx) = [];
                threatlevel_string = string(threat_level_clean);
                threat_level_attack = []
                for ii = 1:length(threatlevel_string)
                    if threatlevel_string(ii) == "attack"
                        
                        threat_level_attack = [threat_level_attack , ii];
                    end
                end
                % converts race from tbl to cell and from cell to string
                racecell = table2cell(race);
                race_string = string(racecell);
                threat_level_string = string(threat_level_clean);
                tbl_threat_level = tabulate(threat_level_clean); % tabulate shows specific numbers from dataset
                tbl_race = tabulate(racecell);
                
                for ii = 1:length(race_string)
                    if race_string(ii) ~= "B"
                        race_string(ii) = "O";
                    end
                end
                
                for jj = 1:length(threat_level_clean)
                    if threat_level_string(jj) ~= "attack"
                        threat_level_string(jj) = "other";
                    end
                end
                
                
                black_threat_attack = 0; % initializing variables
                other_threat_attack = 0;
                black_other_threat = 0;
                other_other_threat = 0;
                for k = 1:length(threat_level_clean)
                    if threat_level_string(k) == "attack" && race_string(k) == "B"
                        black_threat_attack = black_threat_attack + 1;
                    elseif threat_level_string(k) == "attack" && race_string(k) == "O"
                        other_threat_attack= other_threat_attack + 1;
                    elseif threat_level_string(k) == "other" && race_string(k) == "B"
                        black_other_threat = black_other_threat + 1;
                    elseif threat_level_string(k) == "other" && race_string(k) == "O"
                        other_other_threat = other_other_threat + 1;
                    end
                end
                
                % general pie chart for threat level comparisons
                x2 = cell2mat(tbl_threat_level(:,2))
                labels = {'attack', 'other'};
                pie3(x2,labels)
                title('Threat Level General Comparison')
                
            elseif app.PopulationRaceButton.Value == true
                X = [5.9 60.1 18.5 13.4 2.8 1.3];
                
                % Census data analysis was the only case of hard coding
                labels = {'Asian', 'White', 'Hisp', 'Black', 'Other', 'Native'};
                % Creating the pie chart
                pie(X, labels)
                title('Population of the US')
                
                
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.ButtonDownFcn = createCallbackFcn(app, @UIFigureButtonDown, true);

            % Create ButtonGroup3
            app.ButtonGroup3 = uibuttongroup(app.UIFigure);
            app.ButtonGroup3.Title = 'Button Group3';
            app.ButtonGroup3.Position = [110 161 1 1];

            % Create ClickonthebuttonstoseeagraphButtonGroup
            app.ClickonthebuttonstoseeagraphButtonGroup = uibuttongroup(app.UIFigure);
            app.ClickonthebuttonstoseeagraphButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ClickonthebuttonstoseeagraphButtonGroupSelectionChanged, true);
            app.ClickonthebuttonstoseeagraphButtonGroup.Title = 'Click on the buttons to see a graph!';
            app.ClickonthebuttonstoseeagraphButtonGroup.Position = [35 46 561 413];

            % Create ShootingsbyRaceButton
            app.ShootingsbyRaceButton = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.ShootingsbyRaceButton.Text = 'Shootings by Race';
            app.ShootingsbyRaceButton.Position = [1 349 123 22];
            app.ShootingsbyRaceButton.Value = true;

            % Create BodycamButton_2
            app.BodycamButton_2 = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.BodycamButton_2.Text = 'Bodycam';
            app.BodycamButton_2.Position = [1 313 74 22];

            % Create ThreatLevelRaceButton_4
            app.ThreatLevelRaceButton_4 = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.ThreatLevelRaceButton_4.Text = 'Threat Level/ Race';
            app.ThreatLevelRaceButton_4.Position = [1 269 122 22];

            % Create FleeingRaceButton
            app.FleeingRaceButton = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.FleeingRaceButton.Text = 'Fleeing/ Race';
            app.FleeingRaceButton.Position = [1 223 97 22];

            % Create ShootingLocationsButton_2
            app.ShootingLocationsButton_2 = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.ShootingLocationsButton_2.Text = 'Shooting Locations';
            app.ShootingLocationsButton_2.Position = [1 183 126 22];

            % Create ThreatLevelGeneralButton
            app.ThreatLevelGeneralButton = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.ThreatLevelGeneralButton.Text = 'Threat Level (General)';
            app.ThreatLevelGeneralButton.Position = [1 139 139 23];

            % Create SignsofMentalIllnessButton
            app.SignsofMentalIllnessButton = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.SignsofMentalIllnessButton.Text = 'Signs of Mental Illness';
            app.SignsofMentalIllnessButton.Position = [5 93 142 22];

            % Create PopulationRaceButton
            app.PopulationRaceButton = uiradiobutton(app.ClickonthebuttonstoseeagraphButtonGroup);
            app.PopulationRaceButton.Text = 'Population (Race)';
            app.PopulationRaceButton.Position = [4 49 119 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app_police_brutality_GUI_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
