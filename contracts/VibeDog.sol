// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30; // Garante que estamos usando uma versão compatível do Solidity

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; // Para a funcionalidade de queima
import "@openzeppelin/contracts/access/Ownable.sol"; // Para gerenciamento de propriedade do contrato

contract VibeDog is ERC20, ERC20Burnable, Ownable {
    constructor(address initialOwner)
        ERC20("Vibe Dog", "VIBED") // Define o Nome e o Símbolo do token
        Ownable(initialOwner)     // Define o proprietário inicial do contrato (você)
    {
        // Cria 1 Quatrilhão de tokens e os envia para o proprietário inicial (você)
        // 1_000_000_000_000_000 (1 Quatrilhão)
        // (10**9) representa as 9 casas decimais que definiremos abaixo
        _mint(initialOwner, 1000000000000000 * (10**9));
    }

    // Sobrescreve a função decimals para retornar 9, em vez do padrão 18 da OpenZeppelin.
    // Memecoins frequentemente usam menos decimais.
    function decimals() public pure override returns (uint8) {
        return 9;
    }

    // A funcionalidade de queima (burn) já está incluída por herdar de ERC20Burnable.
    // Qualquer pessoa que possuir tokens VIBED poderá chamar a função burn(amount)
    // para destruir seus próprios tokens.
    // Se você, como proprietário do projeto, quiser queimar tokens da sua carteira de deployer
    // (onde o fornecimento inicial foi mintado), você simplesmente chamará
    // a função burn(amount) a partir dessa carteira.
}