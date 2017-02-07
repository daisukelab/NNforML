function G = configuration_goodness(rbm_w, visible_state, hidden_state)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_state> is a binary matrix of size <number of visible units> by <number of configurations that we're handling in parallel>.
% <hidden_state> is a binary matrix of size <number of hidden units> by <number of configurations that we're handling in parallel>.
% This returns a scalar: the mean over cases of the goodness (negative energy) of the described configurations.
%    pos_hidden_probs = visible_state_to_hidden_probabilities(rbm_w, visible_state);
%    neg_hidden_probs = hidden_state_to_visible_probabilities(rbm_w, hidden_state);
%    G = (sum(pos_hidden_probs) - sum(neg_hidden_probs)) / size(visible_state, 2);
%    Gs = (hidden_state' * rbm_w * visible_state);
%    Gsum = sum(Gs(:))
%    G = Gsum / n_conf;%; % mean(Gs(:))   / size(visible_state, 2);
    total = 0
    n_conf = size(visible_state, 2)
    for i = 1:n_conf
        hs = hidden_state(:,i);
        vs = visible_state(:,i);
        one_G = hs' * rbm_w * vs;
        total = total + one_G;
    endfor
    G = total / n_conf
end
