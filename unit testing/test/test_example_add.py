from src.my_math import add_numbers


def test_add_numbers():
    result = add_numbers(1, 2)
    assert result == 3
