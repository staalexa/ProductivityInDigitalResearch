from src.my_math import multiply_numbers


def test_multiply_numbers():
    result = multiply_numbers(2, 2)
    assert result == 4
