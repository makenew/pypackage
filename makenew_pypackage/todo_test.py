# pylint: disable=missing-docstring
# pylint: disable=unused-import

import pytest

from makenew_pypackage.todo import todo

def test_todo():
    assert todo(True) is True
