# Formal Verification of Qi v1.3

Source code and results of formal verification of Qi wireless charging standard v1.3. 

## Requirements

- ProVerif
- PowerShell

## Usage

Verification is performed by executing `Invoke-ProVerif.ps1` in PowerShell.

```ps
PS > powershell.exe -File .\Invoke-ProVerif.ps1
```

> [!IMPORTANT]
> Verification takes some time to complete.
> For example, it costs approximately 10 minutes when running with 2.50GHz Intel Core i5-13500 and 16GB RAM.

Verification results are saved in `results/` with the following structure:

- `results/`
    - `authenticity`: results of authenticity property
        - `<flow>`: execution flow
    - `privacy`: results of privacy property
        - `<BDID>`: BDID generation method 
            - `<flow A>`: execution flow of PRx A
                - `<flow B>`: execution flow of PRx B

> [!NOTE]
> `graph.ps1` and `table.ps1` are no longer used.