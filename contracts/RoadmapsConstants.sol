// // SPDX-License-Identifier: Apache-2.0

// pragma solidity ^0.8.0;

// library RoadmapsConstants {
//     enum ListName {
//         PREFIX,
//         ENTITY,
//         EARLYEVENT,
//         MIDDLEEVENT,
//         LATEEVENT
//     }

//     string[] nftPrefixChoices = [
//         "Dizzy",
//         "Cool",
//         "Tripping",
//         "Sad",
//         "Confused",
//         "Vibing",
//         "Invisible",
//         "Dumb",
//         "Sleepy",
//         "Hungry",
//         "Mindful",
//         "Conscious",
//         "Epic",
//         "Legendary",
//         "Crypto",
//         "Blockchain",
//         "Doodle",
//         "Bored"
//     ];

//     string[] private nftEntityChoices = [
//         "Ducks",
//         "Geese",
//         "Ants",
//         "Flowers",
//         "Bananas",
//         "Hats",
//         "Knights",
//         "Sailors",
//         "Guys",
//         "Gals",
//         "Wolves",
//         "Elephants",
//         "Vaynerchuks",
//         "Apes"
//     ];

//     string[] private earlyEvents = [
//         "We pay back our investors",
//         "We pay back our grandparents",
//         "We pay back the mafia",
//         "We show our appeciation by airdropping 5 free tokens to holders",
//         "We show our appeciation by airdropping 20 free tokens to lucky members",
//         "We airdrop 30 rare tokens to 10 special members",
//         "We open the Discord to holders",
//         "We open the private Telegram group to members",
//         "We hire a community manager",
//         "We hire some cheap interns",
//         "We hire some questionable developers",
//         "We launch a virtual event where we will talk about NFTs",
//         "We release the whitepaper, describing tokenomic deflationary mechanisms",
//         "We will introduce the origin storyline",
//         "We do...absolutely nothing"
//     ];

//     string[] private middleEvents = [
//         "We select 5 holders to receive a poster with the artist's signature",
//         "We will select 10 holders to receive a shoe with the artist's signature",
//         "We select 20 holders to receive a shirt with the artist's signature",
//         "We will select 30 holders to receive a hat with the artist's signature",
//         "We launch the $ROAD utility token, with 10,000,000 initial supply",
//         "We launch the $SCAM utility token, with 200,000,000,000 initial supply",
//         "We will launch the $MEME utility token, with 69,420 initial supply",
//         "We hold a community raffle for a LEGENDARY NFT",
//         "We hold a community raffle for 5,000 $ROAD",
//         "We will hold a meme contest, and airdrop a LEGENDARY NFT to the winners",
//         "We hold an art contest, and airdrop 10,000 $ROAD to the winners",
//         "We launch FutureDAO, dedicated to saving the future",
//         "We launch MetaDAO, a true DAO for the metaverse"
//     ];

//     string[] private lateEvents = [
//         "We collaborate with Nike on an EXCLUSIVE merch drop",
//         "We collaborate with Louis Vutton on an EXCLUSIVE merch drop",
//         "We collaborate with Marvel on an EXCLUSIVE merch drop",
//         "We collaborate with Radio Shack on an EXCLUSIVE merch drop",
//         "We buy a plot of land in the Metaverse",
//         "We buy a strip club in the Metaverse",
//         "We buy a bar in the Metaverse",
//         "We buy an Arby's in the Metaverse",
//         "We buy Park Place in the Metaverse",
//         "We will release ROADMAP 2.0",
//         "We release edition #1 of our limited-edition comic book",
//         "We will donate 5 ethereum to the Metaverse Foundation",
//         "We donate 10 ethereum to the Coal Miners Association",
//         "We will host an IRL NFT gallery in Berlin",
//         "We host an IRL NFT gallery in Las Vegas",
//         "We will release 3D avatars for cross-metaverse usage",
//         "We launch a play-to-earn game, allowing holders to stake their NFT for $ROAD",
//         "We launch a play-to-earn game, allowing holders to stake their NFT for $SCAM",
//         "We launch a play-to-earn game, allowing holders to stake their NFT for $MEME"
//     ];

//     /**
//      * @notice Convert an integer to a string.
//      *
//      * Inspired by OraclizeAPI's implementation (MIT license).
//      * https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol
//      */
//     function toString(uint256 value) internal pure returns (string memory) {
//         if (value == 0) {
//             return "0";
//         }
//         uint256 temp = value;
//         uint256 digits;
//         while (temp != 0) {
//             digits++;
//             temp /= 10;
//         }
//         bytes memory buffer = new bytes(digits);
//         while (value != 0) {
//             digits -= 1;
//             buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
//             value /= 10;
//         }
//         return string(buffer);
//     }
// }
