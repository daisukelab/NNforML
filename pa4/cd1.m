function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    visible_data = sample_bernoulli(visible_data);
    hid_prob = visible_state_to_hidden_probabilities(rbm_w, visible_data);
    hid_state = sample_bernoulli(hid_prob);
    grad1 = configuration_goodness_gradient(visible_data, hid_state);
    recon_vis_prob = hidden_state_to_visible_probabilities(rbm_w, hid_state);
    recon_vis_state = sample_bernoulli(recon_vis_prob);
    hid_prob2 = visible_state_to_hidden_probabilities(rbm_w, recon_vis_state);
    grad2 = configuration_goodness_gradient(recon_vis_state, hid_prob2);
    ret = grad1 - grad2;
end

% >> a4_main(300, .02, .0005, 1000) -> 0.968603
% >> a4_main(300, .02, .005, 1000) -> 0.322890
% >> a4_main(300, .02, .01, 1000) -> 0.259159
% >> a4_main(300, .02, .05, 1000) -> 0.202482
% >> a4_main(300, .02, .1, 1000) -> 0.198644
% >> a4_main(300, .02, .5, 1000) -> 0.224757

