#ifndef CALCULATIONS_HPP
#define CALCULATIONS_HPP

#include <Eigen/Eigenvalues>

using namespace Eigen;
class Calculations
{
public:
    double Addition(const double &a, const double &b);
    double Subtraction(const double &a, const double &b);
    double Multiplication(const double &a, const double &b);
    double Division(const double &a, const double &b);
    Matrix3d matrixMultiplication(Matrix3d mat1, Matrix3d mat2);
};

#endif