# ifndef PODVIN_AND_LECOMTE_HPP
# define PODVIN_AND_LECOMTE_HPP

# include "../eikonal.hpp"

class Podvin_and_Lecomte : public Eikonal
{
private:

    int nit;

    float * K = nullptr;    
    float * d_K = nullptr;
    float * d_nK = nullptr;
    float * d_nT = nullptr;

    void check_spatial_spacing();

protected:

    float * d_T = nullptr;
    float * d_S = nullptr;

    void set_modeling_message();
    void set_model_boundaries();
    void set_preconditioners();

public:

    void initial_setup();
    void forward_solver();
    void free_space();
};

__global__ void fdm_operators(float * S, float * T, float * K, float * nT, float h, int nxx, int nyy, int nzz);
__global__ void expanding_box(float * K, float * nK, int nxx, int nyy, int nzz);
__global__ void update_volume(float * T, float * nT, float * K, float * nK, int N);

# endif