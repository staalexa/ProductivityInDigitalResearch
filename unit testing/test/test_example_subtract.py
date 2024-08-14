from src.my_math import subtract_numbers


def test_subtract_numbers():
    result = subtract_numbers(1, 2)
    assert result == -1
