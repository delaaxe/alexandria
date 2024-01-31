//! Norm of an T array.
use alexandria_math::fast_root::fast_nr_optimize;
use alexandria_math::pow;

/// Compute the norm for an T array.
/// # Arguments
/// * `array` - The inputted array.
/// * `ord` - The order of the norm.
/// * `iter` - The number of iterations to run the algorithm
/// # Returns
/// * `u128` - The norm for the array.
fn norm<T, +Into<T, u128>, +Zeroable<T>, +Copy<T>>(
    mut xs: Span<T>, ord: u128, iter: usize
) -> u128 {
    let mut norm: u128 = 0;
    while !xs
        .is_empty() {
            let x = xs.pop_front().unwrap();
            if ord == 0 {
                if (*x).is_non_zero() {
                    norm += 1;
                }
            } else {
                norm += pow((*x).into(), ord);
            }
        };

    if ord == 0 {
        return norm;
    }

    fast_nr_optimize(norm, ord, iter)
}
