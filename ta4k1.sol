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
		tachki.push((tachkiD(_brand, _color, _V, _maxSpeed, _fuelComsump, _timeToD)));
	}

	function delTachka(uint256 index) external {
		require(index < tachki.length);
        tachki[index] = tachki[tachki.length-1];
		tachki.pop();
	} 

	function getBestTackaInfo() external view returns (tachkiD memory bestTachka, uint256 bestTachkaIndex) {
		uint256 bestDistance = 0;
		uint256 bestTime = type(uint256).max;

		for (uint256 i = 0; i < tachki.length; i++) {
			if (tachki[i].V / tachki[i].fuelConsump < 31) {
				if (bestTime < type(uint256).max) {
					continue;
				} else {
					uint256 distance = ((1000000 * tachki[i].V) / tachki[i].fuelConsump);
					if (distance > bestDistance) {
						bestDistance = distance;
						bestTachkaIndex = i;
					} else {
						continue;
					}
				}
			} else {
				uint256 time = 0;
				if (tachki[i].maxSpeed > 100) {
					time = 11160000 / tachki[i].maxSpeed + (tachki[i].maxSpeed * tachki[i].timeToD) / 200;
				} else {
					time = 11160000 / tachki[i].maxSpeed + tachki[i].timeToD / 2; 
				}
				if (time < bestTime) {
					bestTime = time;
					bestTachkaIndex = i;
				} else {
					continue;
				}
			}
		}
		bestTachka = tachki[bestTachkaIndex];
	}

     function allTachki() external view returns (tachkiD[] memory) {
        return tachki;
}
}