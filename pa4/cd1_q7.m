function ret = cd1_q7(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    hid_prob = visible_state_to_hidden_probabilities(rbm_w, visible_data);
    hid_state = sample_bernoulli(hid_prob);
    grad1 = configuration_goodness_gradient(visible_data, hid_state);
    recon_vis_prob = hidden_state_to_visible_probabilities(rbm_w, hid_state);
    recon_vis_state = sample_bernoulli(recon_vis_prob);
    hid_prob2 = visible_state_to_hidden_probabilities(rbm_w, recon_vis_state);
    hid_state2 = sample_bernoulli(hid_prob2);
    grad2 = configuration_goodness_gradient(recon_vis_state, hid_state2);
    ret = grad1 - grad2;
end
