// SPDX-License-Identifier: MTT
pragma solidity >=0.8.2 <0.9.0;

contract superTachki {
    struct tachkiD {
        string brand;
        string color;
        uint256 V;
        uint256 maxSpeed;
        uint256 fuelConsump;
        uint256 timeToD;
    }
    tachkiD[] public tachki;

    function addTachka(
        string memory _brand,
        string memory _color,
        uint256 _V,
        uint256 _maxSpeed,
        uint256 _fuelComsump,
        uint256 _timeToD
    ) external {
        tachki.push(
            (tachkiD(_brand, _color, _V, _maxSpeed, _fuelComsump, _timeToD))
        );
    }

    function delTachka(uint256 index) public {
        require(index < tachki.length);
        delete tachki[index];
    }

    // function get() external view returns (uint256) {
    //     return tachki.length;
    // }

    // function get1() external view returns (tachkiD[] memory) {
    //     return tachki;
    // }

    function getTheBestTachkaInfo()
        public
        view
        returns (tachkiD memory tachkaInfo, uint256 bestTachkaIndex)
    {
        uint256 bestDistance = 0;
        uint256 bestTime = type(uint256).max;

        for (uint256 i = 0; i < tachki.length; i++) {
            if (tachki[i].V / tachki[i].fuelConsump < 31) {
                if (bestTime < type(uint256).max) {
                    continue;}
                else uint256 distance = (1000000 * tachki[i].V) /
                        tachki[i].fuelConsump;
                    if (distance > bestDistance) {
                        bestDistance = distance;
                        bestTachkaIndex = i;
                    }
                }
                if (tachki[i].maxSpeed < 100) {
                    uint256 time = 111600000 /
                        tachki[i].maxSpeed +
                        tachki[i].timeToD /
                        2;
                    if (time < bestTime) {
                        bestTime = time;
                        bestTachkaIndex = i;
                    }
                } else {
                    if (tachki[i].maxSpeed > 100) {
                        uint256 calculatedTime = 111600000 /
                            tachki[i].maxSpeed +
                            (tachki[i].maxSpeed * tachki[i].timeToD) /
                            200;
                        if (calculatedTime < bestTime) {
                            bestTime = calculatedTime;
                            bestTachkaIndex = i;
                        }
                    }
                }
            }
            //  else {
            //     if (tachki[i].V / tachki[i].fuelConsump >= 31) {
            //         if (bestTime < type(uint256).max){
            //             uint256 distance = (1000000 * tachki[i].V) /
            //                 tachki[i].fuelConsump;
            //             if (distance > bestDistance) {
            //                 bestDistance = distance;
            //                 bestTachkaIndex = i;
            //             if (tachki[i].maxSpeed < 100) {
            //             uint256 time = 111600000 /
            //                 tachki[i].maxSpeed +
            //                 tachki[i].timeToD /
            //                 2;
            //             if (time < bestTime) {
            //                 bestTime = time;
            //                 bestTachkaIndex = i;
            //             }
            //         } else {
            //             if (tachki[i].maxSpeed > 100) {
            //                 uint256 calculatedTime = 111600000 /
            //                     tachki[i].maxSpeed +
            //                     (tachki[i].maxSpeed * tachki[i].timeToD) /
            //                     200;
            //                 if (calculatedTime < bestTime) {
            //                     bestTime = calculatedTime;
            //                     bestTachkaIndex = i;
            //                 }
            //             }
            //         }
                        
            //             }
            //         }

                    
            //     }
            // }
        }
        tachkaInfo = tachki[bestTachkaIndex];
    }
}
