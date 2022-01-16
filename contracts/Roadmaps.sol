/**
 *Submitted for verification at Etherscan.io on 2021-08-27
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";

contract Roadmaps is ERC721Enumerable, ReentrancyGuard, Ownable {
    string[] private earlyEvents = [
        "We pay back our investors",
        "We pay back our grandparents",
        "We pay back the mafia",
        "We show our appeciation by airdropping 5 free tokens to holders",
        "We show our appeciation by airdropping 20 free tokens to lucky members",
        "We airdrop 30 rare tokens to 10 special members",
        "We open the Discord to holders",
        "We open the private Telegram group to members",
        "We hire a community manager",
        "We hire some cheap interns",
        "We hire some questionable developers",
        "We will launch a virtual event where we will talk about NFTs",
        "We will release the whitepaper, describing tokenomic deflationary mechanisms",
        "We will introduce the origin storyline"
    ];

    string[] private middleEvents = [
        "We will select 5 holders to receive a poster with the artist's signature",
        "We will select 10 holders to receive a shoe with the artist's signature",
        "We will select 20 holders to receive a shirt with the artist's signature",
        "We will select 30 holders to receive a hat with the artist's signature",
        "We will launch the $ROAD utility token, with 10,000,000 initial supply",
        "We will launch the $SCAM utility token, with 200,000,000,000 initial supply",
        "We will launch the $MEME utility token, with 69,420 initial supply",
        "We hold a community raffle for a LEGENDARY NFT",
        "We hold a community raffle for 5,000 $ROAD",
        "We will hold a meme contest, and airdrop a LEGENDARY NFT to the winners",
        "We will hold an art contest, and airdrop 10,000 $ROAD to the winners"
    ];

    string[] private lateEvents = [
        "We collaborate with Nike on an EXCLUSIVE merch drop",
        "We collaborate with Louis Vutton on an EXCLUSIVE merch drop",
        "We collaborate with Marvel on an EXCLUSIVE merch drop",
        "We collaborate with Radio Shack on an EXCLUSIVE merch drop",
        "We buy a plot of land in the Metaverse",
        "We buy a strip club in the Metaverse",
        "We buy a bar in the Metaverse",
        "We buy an Arby's in the Metaverse",
        "We will release ROADMAP 2.0",
        "We release edition #1 of our limited-edition comic book",
        "We will donate 5 ethereum to the Metaverse Foundation",
        "We will donate 10 ethereum to the Coal-",
        "We will host an IRL NFT gallery in Berlin",
        "We will host an IRL NFT gallery in Las Vegas",
        "We will release 3D avatars for cross-metaverse usage",
        "We launch a play-to-earn game, allowing holders to stake their NFT for $ROAD"
    ];

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function shuffle(string[] memory arr)
        internal
        pure
        returns (string[] memory)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            uint256 n = i +
                (uint256(keccak256(abi.encodePacked("999"))) %
                    (arr.length - i));
            string memory temp = arr[n];
            arr[n] = arr[i];
            arr[i] = temp;
        }
        return arr;
    }

    function getEarly(uint256 tokenId) public view returns (string[3] memory) {
        return earlyPluck(tokenId);
    }

    function getMiddle(uint256 tokenId) public view returns (string[3] memory) {
        return middlePluck(tokenId);
    }

    function getLate(uint256 tokenId) public view returns (string[4] memory) {
        return latePluck(tokenId);
    }

    function earlyPluck(uint256 tokenId)
        internal
        view
        returns (string[3] memory)
    {
        uint256 rand = random(toString(tokenId));

        string[] memory shuffledEarlyEvents = shuffle(earlyEvents);

        string[3] memory output = [
            shuffledEarlyEvents[rand % shuffledEarlyEvents.length],
            shuffledEarlyEvents[(rand + 1) % shuffledEarlyEvents.length],
            shuffledEarlyEvents[(rand + 2) % shuffledEarlyEvents.length]
        ];

        return output;
    }

    function middlePluck(uint256 tokenId)
        internal
        view
        returns (string[3] memory)
    {
        uint256 rand = random(toString(tokenId));

        string[] memory shuffledMiddleEvents = shuffle(middleEvents);

        string[3] memory output = [
            shuffledMiddleEvents[rand % shuffledMiddleEvents.length],
            shuffledMiddleEvents[(rand + 1) % shuffledMiddleEvents.length],
            shuffledMiddleEvents[(rand + 2) % shuffledMiddleEvents.length]
        ];
        return output;
    }

    function latePluck(uint256 tokenId)
        internal
        view
        returns (string[4] memory)
    {
        uint256 rand = random(string(abi.encodePacked(toString(tokenId))));

        string[] memory shuffledLateEvents = shuffle(lateEvents);

        string[4] memory output = [
            shuffledLateEvents[rand % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 1) % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 2) % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 3) % shuffledLateEvents.length]
        ];
        return output;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        uint256 rand = random(toString(tokenId));

        string[21] memory parts;

        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 550 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        string[3] memory earlyparts = getEarly(tokenId);
        string[3] memory middleparts = getMiddle(tokenId);
        string[4] memory lateParts = getLate(tokenId);

        parts[1] = string(abi.encodePacked("10%: ", earlyparts[0]));

        parts[2] = '</text><text x="10" y="40" class="base">';

        parts[3] = string(abi.encodePacked("20%: ", earlyparts[1]));

        parts[4] = '</text><text x="10" y="60" class="base">';

        uint256 rarenum = rand % 21;
        if (rarenum < 15) {
            parts[5] = string(abi.encodePacked("30%: ", earlyparts[2]));
        } else if (rarenum < 18) {
            parts[5] = string(abi.encodePacked("27.1828%: ", earlyparts[2]));
        } else {
            parts[5] = string(abi.encodePacked("31.4159%: ", earlyparts[2]));
        }

        parts[6] = '</text><text x="10" y="80" class="base">';

        parts[7] = string(abi.encodePacked("40%: ", earlyparts[0]));

        parts[8] = '</text><text x="10" y="100" class="base">';

        parts[9] = string(abi.encodePacked("50%: ", earlyparts[0]));

        parts[10] = '</text><text x="10" y="120" class="base">';

        parts[11] = string(abi.encodePacked("60%: ", middleparts[2]));

        parts[12] = '</text><text x="10" y="140" class="base">';

        parts[13] = string(abi.encodePacked("70%: ", lateParts[0]));

        parts[14] = '</text><text x="10" y="160" class="base">';

        parts[15] = string(abi.encodePacked("80%: ", lateParts[1]));

        parts[16] = '</text><text x="10" y="180" class="base">';

        parts[17] = string(abi.encodePacked("90%: ", lateParts[2]));

        parts[18] = '</text><text x="10" y="200" class="base">';

        parts[19] = string(abi.encodePacked("100%: ", lateParts[3]));

        parts[20] = "</text></svg>";

        string memory output = string(
            abi.encodePacked(
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[4],
                parts[5],
                parts[6],
                parts[7],
                parts[8]
            )
        );
        output = string(
            abi.encodePacked(
                output,
                parts[9],
                parts[10],
                parts[11],
                parts[12],
                parts[13],
                parts[14],
                parts[15],
                parts[16]
            )
        );
        output = string(
            abi.encodePacked(output, parts[17], parts[18], parts[19], parts[20])
        );

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Bag #',
                        toString(tokenId),
                        '", "description": "Loot is randomized adventurer gear generated and stored on chain. Stats, images, and other functionality are intentionally omitted for others to interpret. Feel free to use Loot in any way you want.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(output)),
                        '"}'
                    )
                )
            )
        );
        output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 7778, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }

    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 7777 && tokenId < 8001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }

    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT license
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    constructor() ERC721("Roadmaps", "ROAD") Ownable() {}
}
