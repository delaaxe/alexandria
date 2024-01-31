use alexandria_linalg::dot::dot;

#[test]
#[available_gas(2000000)]
fn dot_product_test() {
    let xs: Array<u64> = array![3, 5, 7];
    let ys = array![11, 13, 17];
    assert!(dot(xs.span(), ys.span()) == 217, "invalid dot product");
}

#[test]
#[should_panic(expected: ('Arrays must have the same len',))]
#[available_gas(2000000)]
fn dot_product_test_check_len() {
    let xs: Array<u64> = array![1];
    let ys = array![];
    dot(xs.span(), ys.span());
}
