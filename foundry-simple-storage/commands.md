# Deploy

```bash
forge script script/deploy-simple-storage.s.sol --rpc-url 127.0.0.1:8545 --broadcast --account anvil-default --sender 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 -vvvv
```

# Cast wallet

```bash
 cast wallet import defaultKey --interactive
```

# Cast send

```bash
cast send 0x8464135c8F25Da09e49BC8782676a84730C318bC "store(uint256)" 123 --rpc-url 127.0.0.1:8545 --account anvil-default
```

# Cast call

```bash
cast call 0x8464135c8F25Da09e49BC8782676a84730C318bC "retrieve()"
```

# Foundry

## Use vanilla foundry

    ```bash
    foundryup
    ```

## Use foundry zksync

     ```bash
    foundryup-zksync
    ```
