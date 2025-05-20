# Contracts Folder

## Overview
The `contracts` folder contains all smart contracts related to the Retail DAO and the `$RETAIL` token, deployed on the Base Network. These contracts, mirrored from BaseScan, include the logic for token minting, governance, and configuration. The folder is organized into subdirectories to distinguish between the **Original Mint Authorized DAO**, responsible for minting `$RETAIL` tokens, and the **Current DAO**, which now governs the token after governance was relinked post-minting. This separation reflects the Retail DAO's evolution and the ongoing plan to secure the token structure by "bricking" the Original Mint Authorized DAO.

## Purpose
This folder serves as a centralized repository for:
- Mirroring publicly visible contracts from BaseScan for transparency and auditability.
- Documenting the contracts for the Original Mint Authorized DAO, which retains an active mint function.
- Housing the contracts for the Current DAO, responsible for `$RETAIL` token governance.
- Supporting the governance process to revoke mint permissions in the Original Mint Authorized DAO, capping the token supply at 1 billion tokens and eliminating the inflationary scheme.
- Providing a reference for developers, auditors, and the Retail DAO community to understand the project's smart contract architecture.

## Background
The `$RETAIL` token was initially deployed via the **Original Mint Authorized DAO** (contract address: `0xc7167e360bD63696a7870C0Ef66939E882249F20`) using the Aragon framework. This DAO managed token minting, with an active mint function allowing authorized addresses to create new tokens, resulting in an inflationary supply. After minting, governance was **relinked** to the **Current DAO**, a separate entity designed for ongoing token governance, leaving the Original Mint Authorized DAO as a standalone entity with minting capabilities.

Due to security concerns, including risks of unauthorized minting and governance exploits, and remove all warning flags from common token scanners, the Retail DAO community is pursuing a plan to:
- Cap the `$RETAIL` token supply at 1 billion tokens.
- Revoke all mint permissions in the Original Mint Authorized DAO to prevent further token creation.
- "Brick" the Original Mint Authorized DAO by disabling its minting and governance functions, ensuring immutability.
- Maintain robust governance through the Current DAO, securing the `$RETAIL` token structure.