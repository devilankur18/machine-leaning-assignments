function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



hx = sigmoid(X*theta);
f1 = -1 * ((log (hx))' * y);
f2 = -1 * ((log( 1 - hx))' * ( 1 - y));

theta_clone = theta;
theta_clone(1,1) = 0;

J = ((1 / ( m))* ( f1 + f2 )) + ((lambda / (2 * m)) * (theta_clone' * theta_clone) );

grad_temp = (1 / m) * ( X' * (hx - y));

grad_lamda = (lambda / m) .* theta_clone;

grad = grad_temp + grad_lamda;



% =============================================================

end
