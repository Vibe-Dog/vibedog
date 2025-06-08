// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importa ERC20 padrão
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// Importa funcionalidade de burn
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// Importa Ownable para renúncia de propriedade
import "@openzeppelin/contracts/access/Ownable.sol";

// Contrato VibeDog
contract VibeDog is ERC20, ERC20Burnable, Ownable {
    // Construtor define nome, símbolo e supply inicial
    constructor() ERC20("Vibe Dog", "VIBED") Ownable(msg.sender) {
        // Mint 1 quatrilhão para quem faz deploy
        // 1_000_000_000_000_000 * 10^9 = 1e24 unidades
        _mint(msg.sender, 1000000000000000 * 10**9);
    }

    // Override decimals para 9 casas
    function decimals() public pure override returns (uint8) {
        return 9;
    }

    // Qualquer um pode queimar tokens usando burn()
    // Dono pode renunciar propriedade usando renounceOwnership()
}