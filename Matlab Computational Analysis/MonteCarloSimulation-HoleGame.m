paths = [0,100,1];

hole_pos = randi([2,99],3,1) %Creates randomly three holes as an index.
player1_pos = 1;
player1_path = [];

player2_pos = 1;
player2_path = [];

turn_check = true; %If it is true, player1's turn.
dice_roll = 0

while(true)
    dice_roll = randi([1,6])
    if(turn_check == true)
        %Player1's turn
        player1_pos = player1_pos + dice_roll;
        if(ismember(player1_pos,hole_pos))
            %Player 1 restarts the game. Steps in the hole
            player1_pos = 1;           
        end
        %Records the paths of player1 through the game.
        player1_path(length(player1_path)+1) = player1_pos;
        turn_check = false;

    else %Player2's turn
        player2_pos = player2_pos + dice_roll;
        if(ismember(player2_pos,hole_pos))
             %Player 2 restarts the game. Steps in the hole
             player2_pos = 1;     
        end

        %Records the paths of player2 through the game.
        player2_path(length(player2_path)+1) = player2_pos;
        turn_check = true;

    end
    if(player1_pos >= 100)
        display("Player 1 wins!")
        break
    end

    if(player2_pos >= 100)
        display("Player 2 wins!")
         break
    end

end
    plot(player1_path);
    hold on
    plot(player2_path);
    legend(["Player1","Player2"])
