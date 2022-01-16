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
    string[] private nftPrefixChoices = [
        "Dizzy",
        "Cool",
        "Tripping",
        "Sad",
        "Confused",
        "Vibing",
        "Invisible",
        "Dumb",
        "Sleepy",
        "Hungry",
        "Mindful",
        "Conscious",
        "Epic",
        "Legendary"
    ];

    string[] private nftEntityChoices = [
        "Ducks",
        "Geese",
        "Ants",
        "Flowers",
        "Bananas",
        "Hats",
        "Knights",
        "Sailors",
        "Guys",
        "Gals",
        "Wolves",
        "Elephants"
    ];

    string[] private GroupChoices = [
        "supporters",
        "mafia",
        "gang members",
        "fools",
        "community members",
        "grandmas"
    ];

    string[] private brandNameChoices = [
        "Marvel",
        "Nike",
        "Louis Vutton",
        "Patron"
    ];

    string[] private numOfPeople = ["1", "10", "100", "1000", "10000", "31415"];

    string[] private amountMoney = [
        "1",
        "10",
        "69",
        "420",
        "666",
        "999",
        "4242",
        "8888",
        "10000"
    ];

    string[] private physicalArt = ["t-shirt", "cup", "print"];

    string[] private earlyEvents = [
        string(
            abi.encodePacked(
                "We pay back and feed our "
                // GroupChoices[rand % GroupChoices.length]
            )
        ),
        string(
            abi.encodePacked(
                "We distribute 10 free claim opportunities to early ",
                // GroupChoices[rand % GroupChoices.length],
                "."
            )
        ),
        "Our first global event will take place in Metaverse",
        "We will launch a virtual event where we will talk about NFTs",
        string(
            abi.encodePacked(
                "We want to show our appreciation by airdropping special 5 ",
                // NFTname,
                " to 5 early ",
                // GroupChoices[rand % GroupChoices.length],
                "."
            )
        ),
        string(
            abi.encodePacked(
                "We airdrop 10 ",
                "[NFTName]",
                " in discord secretly."
            )
        ),
        "We will release whitepaper, describing tokenomicsm deflationary mechanisms, and other smart stuff",
        "We will have the origins and storyline Introduced"
    ];

    string[] private middleEvents = [
        string(
            abi.encodePacked(
                "Select ",
                // numOfPeople[rand % numOfPeople.length],
                " holders to give away ",
                // physicalArt[rand % physicalArt.length],
                " with artist' signature."
            )
        ),
        string(
            abi.encodePacked(
                "Launch $",
                // tokenName,
                " utility token"
            )
        ),
        string(
            abi.encodePacked(
                "Community Raffle! Lucky ",
                // numOfPeople[(rand + 1) % numOfPeople.length],
                " holders will be given $",
                // amountMoney[rand % amountMoney.length],
                "."
            )
        )
    ];

    string[] private lateEvents = [
        string(
            abi.encodePacked(
                "We collaborate with ",
                // brandNameChoices[rand % brandNameChoices.length],
                " on an EXCLUSIVE merch drop"
            )
        ),
        "We buy a plot of land in the Metaverse",
        "We release Roadmap 2.0",
        "We release edition #1 of our comic"
    ];

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function toUpper(string memory str) internal pure returns (string memory) {
        bytes memory bStr = bytes(str);
        bytes memory bUpper = new bytes(bStr.length);
        for (uint256 i = 0; i < bStr.length; i++) {
            // Lowercase character...
            if ((uint8(bStr[i]) >= 97) && (uint8(bStr[i]) <= 122)) {
                // So we subtract 32 to make it uppercase
                bUpper[i] = bytes1(uint8(bStr[i]) - 32);
            } else {
                bUpper[i] = bStr[i];
            }
        }
        return string(bUpper);
    }

    function getSlice(
        uint256 begin,
        uint256 end,
        string memory text
    ) public pure returns (string memory) {
        bytes memory a = new bytes(end - begin + 1);
        for (uint256 i = 0; i <= end - begin; i++) {
            a[i] = bytes(text)[i + begin - 1];
        }
        return string(a);
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

    function getNftName(uint256 tokenId) public view returns (string memory) {
        uint256 randPrefix = random(
            string(abi.encodePacked(toString(tokenId), "prefix"))
        );
        uint256 randEntity = random(
            string(abi.encodePacked(toString(tokenId), "entity"))
        );
        string memory nftName = string(
            abi.encodePacked(
                nftPrefixChoices[randPrefix % nftPrefixChoices.length],
                " ",
                nftEntityChoices[randEntity % nftEntityChoices.length]
            )
        );
        return nftName;
    }

    function earlyPluck(uint256 tokenId)
        internal
        view
        returns (string[3] memory)
    {
        uint256 rand = random(toString(tokenId));

        string[3] memory output = [
            earlyEvents[rand % earlyEvents.length],
            earlyEvents[(rand + 1) % earlyEvents.length],
            earlyEvents[(rand + 2) % earlyEvents.length]
        ];

        // string[2] memory earlyEvents_generous = [
        //     "We will launch a meme challenge among holders -- 10ETH prize",
        //     string(
        //         abi.encodePacked(
        //             "We will give away 99% of our sales to our ",
        //             GroupChoices[rand % GroupChoices.length],
        //             "."
        //         )
        //     )
        // ];

        // string[1] memory earlyEvents_lazy = ["We will open a Discord"];

        // string[1] memory earlyEvents_dramatic = [
        //     "Zopzido, our artist, girl boss, and founder, resigns from her job and realizes her childhood dream of becoming a full-time artist."
        // ];

        return output;
    }

    function middlePluck(uint256 tokenId)
        internal
        view
        returns (string[3] memory)
    {
        uint256 rand = random(toString(tokenId));

        string[3] memory output = [
            middleEvents[rand % middleEvents.length],
            middleEvents[(rand + 1) % middleEvents.length],
            middleEvents[(rand + 2) % middleEvents.length]
        ];
        return output;
    }

    function latePluck(uint256 tokenId)
        internal
        view
        returns (string[4] memory)
    {
        uint256 rand = random(string(abi.encodePacked(toString(tokenId))));

        // "We buy a plot of land in the Metaverse",
        // "We host " + eventType + "in the Metaverse",
        // "We launch a Play-To-Earn game, allowing you to stake your " + animalName,
        // "We release the first edition of our comic, in collaboration with " + artistName,
        // "We donate " + amount + " to " + charityName,
        // "We host an art gallery event IRL in " + cityName,
        // "We release Roadmap 2.0",
        // "We release " + animalName + " as voxel avatars for the metaverse"
        string[4] memory output = [
            lateEvents[rand % lateEvents.length],
            lateEvents[(rand + 1) % lateEvents.length],
            lateEvents[(rand + 2) % lateEvents.length],
            lateEvents[(rand + 3) % lateEvents.length]
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

        string[23] memory parts;
        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 550 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        string memory nftName = getNftName(tokenId);
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

        parts[20] = '</text><text x="10" y="220" class="base">';

        parts[21] = string(abi.encodePacked("Roadmap for the ", nftName));

        parts[22] = "</text></svg>";

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
            abi.encodePacked(
                output,
                parts[17],
                parts[18],
                parts[19],
                parts[20],
                parts[21],
                parts[22]
            )
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
