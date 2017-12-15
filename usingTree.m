distance = 10;
steps = 7;

tree = AddNode(distance, steps);
% DrawDecisionTree(tree, '')
meetCount = CalculateMeetCounts(tree);
p = meetCount / 4^steps

function [tree] = AddNode(dist, steps)
    tree.steps = steps;
    tree.dist = dist;
    if steps * 2 < dist || steps == 0 || dist <= 0
        tree.kids = {};
        return
    end
    tree.kids = cell(1,4);
    tree.kids{1} = AddNode(dist, steps - 1);
    tree.kids{2} = AddNode(dist + 2, steps - 1);
    tree.kids{3} = AddNode(dist - 2, steps - 1);
    tree.kids{4} = AddNode(dist, steps - 1);

end

function [count] = CalculateMeetCounts(tree)
    count = 0;
    if tree.dist <= 0
        count = 4 ^ tree.steps;
        return
    end
    for i = 1:length(tree.kids)
        count = count + CalculateMeetCounts(tree.kids{i});
    end
end




