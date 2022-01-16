/**
 *Submitted for verification at Etherscan.io on 2021-08-27
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "base64-sol/base64.sol";
import "./strings.sol";

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
        "Legendary",
        "Crypto",
        "Blockchain",
        "Doodle",
        "Bored"
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
        "Elephants",
        "Vaynerchuks",
        "Apes"
    ];

    string[] private earlyEvents = [
        "We pay back our investors",
        "We pay back our grandparents",
        "We pay back the mafia",
        "We show our appeciation by airdropping 5 free tokens to holders",
        "We show our appeciation by airdropping 20 free tokens to lucky members",
        "We airdrop 30 rare tokens to 10 special members",
        "We open the Discord to holders",
        "We open the private Telegram group to members",
        "We hire a community manager"
        "We hire some cheap interns",
        "We hire some questionable developers",
        "We launch a virtual event where we will talk about NFTs",
        "We release the whitepaper, describing tokenomic deflationary mechanisms",
        "We will introduce the origin storyline",
        "We do...absolutely nothing"
    ];

    string[] private middleEvents = [
        "We select 5 holders to receive a poster with the artist's signature",
        "We will select 10 holders to receive a shoe with the artist's signature",
        "We select 20 holders to receive a shirt with the artist's signature",
        "We will select 30 holders to receive a hat with the artist's signature",
        "We launch the $ROAD utility token, with 10,000,000 initial supply",
        "We launch the $SCAM utility token, with 200,000,000,000 initial supply",
        "We will launch the $MEME utility token, with 69,420 initial supply",
        "We hold a community raffle for a LEGENDARY NFT",
        "We hold a community raffle for 5,000 $ROAD",
        "We will hold a meme contest, and airdrop a LEGENDARY NFT to the winners",
        "We hold an art contest, and airdrop 10,000 $ROAD to the winners",
        "We launch FutureDAO, dedicated to saving the future",
        "We launch MetaDAO, a true DAO for the metaverse"
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
        "We buy Park Place in the Metaverse",
        "We will release ROADMAP 2.0",
        "We release edition #1 of our limited-edition comic book",
        "We will donate 5 ethereum to the Metaverse Foundation",
        "We donate 10 ethereum to the Coal Miners Association",
        "We will host an IRL NFT gallery in Berlin",
        "We host an IRL NFT gallery in Las Vegas",
        "We will release 3D avatars for cross-metaverse usage",
        "We launch a play-to-earn game, allowing holders to stake their NFT for $ROAD",
        "We launch a play-to-earn game, allowing holders to stake their NFT for $SCAM",
        "We launch a play-to-earn game, allowing holders to stake their NFT for $MEME"
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

    function getNftName(uint256 tokenId) public view returns (string memory) {
        uint256 randPrefix = random(
            string(abi.encodePacked(strings.toString(tokenId), "prefix"))
        );
        uint256 randEntity = random(
            string(abi.encodePacked(strings.toString(tokenId), "entity"))
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

    function getEarly(uint256 tokenId) public view returns (string[3] memory) {
        return pluck(tokenId, earlyEvents);
    }

    function getMiddle(uint256 tokenId) public view returns (string[3] memory) {
        return pluck(tokenId, middleEvents);
    }

    function getLate(uint256 tokenId) public view returns (string[4] memory) {
        return latePluck(tokenId);
    }

    function pluck(uint256 tokenId, string[] memory arr)
        internal
        pure
        returns (string[3] memory)
    {
        uint256 rand = random(strings.toString(tokenId));

        string[] memory shuffledEarlyEvents = shuffle(arr);

        return [
            shuffledEarlyEvents[rand % shuffledEarlyEvents.length],
            shuffledEarlyEvents[(rand + 1) % shuffledEarlyEvents.length],
            shuffledEarlyEvents[(rand + 2) % shuffledEarlyEvents.length]
        ];
    }

    function latePluck(uint256 tokenId)
        internal
        view
        returns (string[4] memory)
    {
        uint256 rand = random(
            string(abi.encodePacked(strings.toString(tokenId)))
        );

        string[] memory shuffledLateEvents = shuffle(lateEvents);

        return [
            shuffledLateEvents[rand % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 1) % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 2) % shuffledLateEvents.length],
            shuffledLateEvents[(rand + 3) % shuffledLateEvents.length]
        ];
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        uint256 rand = random(strings.toString(tokenId));

        string[3] memory earlyparts = getEarly(tokenId);
        string[3] memory middleparts = getMiddle(tokenId);
        string[4] memory lateParts = getLate(tokenId);

        string[23] memory parts;

        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 550 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';

        string memory NFTname = string(
            abi.encodePacked(
                nftPrefixChoices[rand % nftPrefixChoices.length],
                " ",
                nftEntityChoices[rand % nftEntityChoices.length]
            )
        );

        parts[1] = string(abi.encodePacked("Roadmap for ", NFTname));

        parts[2] = '</text><text x="10" y="80" class="base">';

        parts[3] = string(abi.encodePacked("10%: ", earlyparts[0]));

        parts[4] = '</text><text x="10" y="110" class="base">';

        parts[5] = string(abi.encodePacked("20%: ", earlyparts[1]));

        parts[6] = '</text><text x="10" y="140" class="base">';

        parts[7] = string(abi.encodePacked("30%: ", earlyparts[2]));

        parts[8] = '</text><text x="10" y="170" class="base">';

        parts[9] = string(abi.encodePacked("40%: ", earlyparts[0]));

        parts[10] = '</text><text x="10" y="200" class="base">';

        parts[11] = string(abi.encodePacked("50%: ", earlyparts[0]));

        parts[12] = '</text><text x="10" y="230" class="base">';

        parts[13] = string(abi.encodePacked("60%: ", middleparts[2]));

        parts[14] = '</text><text x="10" y="260" class="base">';

        parts[15] = string(abi.encodePacked("70%: ", lateParts[0]));

        parts[16] = '</text><text x="10" y="290" class="base">';

        parts[17] = string(abi.encodePacked("80%: ", lateParts[1]));

        parts[18] = '</text><text x="10" y="320" class="base">';

        parts[19] = string(abi.encodePacked("90%: ", lateParts[2]));

        parts[20] = '</text><text x="10" y="350" class="base">';

        parts[21] = string(abi.encodePacked("100%: ", lateParts[3]));

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
                        '{"name": "Roadmap #',
                        strings.toString(tokenId),
                        '", "description": "Generative roadmaps", "image": "data:image/svg+xml;base64,',
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

    constructor() ERC721("Roadmaps", "ROAD") Ownable() {}
}
