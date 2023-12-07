/*  Yao
 *  Lin
 *  Yelin2
 */

#ifndef A1_HPP
#define A1_HPP

#include <vector>


void filter_2d(long long int n, long long int m, const std::vector<float>& K, std::vector<float>& A) {
    std::vector<float> temp = A;
    #pragma omp parallel for default(none) shared(temp, A, n, m, K) collapse(2) schedule(static) 
    for(int i = 1; i < n-1; i++){
        for(int j = 1; j < m-1; j++){
            A[i*m+j] = temp[(i-1)*m+j-1]*K[0]+temp[(i-1)*m+j]*K[1]+temp[(i-1)*m+j+1]*K[2]+temp[i*m+j-1]*K[3]+temp[i*m+j]*K[4]+temp[i*m+j+1]*K[5]+temp[(i+1)*m+j-1]*K[6]+temp[(i+1)*m+j]*K[7]+temp[(i+1)*m+j+1]*K[8];
        }
    } 
} // filter_2d

#endif // A1_HPP
