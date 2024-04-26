<#
# Privacy with Qi Authentication.
#
# > powershell.exe -ExecutionPolicy RemoteSigned -File .\graph.ps1
#>

Workflow Run-ProVerif {
    $authflowA = @(
         'simpleflow'
        #  'flowwithcaching'
        #  'flowwithcaching_cached'
        #  'flowwithcachingandrevocation'
        #  'flowwithcachingandrevocation_cached'
        #  'flowwithcachingandrevocation_revoked'
        #  'flowwithcachingandrevocation_cached_revoked'
        #  'challengefirstflow'
        #  'challengefirstflow_cached'
        #  'challengefirstflow_revoked'
        #  'challengefirstflow_cached_revoked'
    )

    $authflowB = @(
         'simpleflow'
        #  'flowwithcaching'
        #  'flowwithcaching_cached'
        #  'flowwithcachingandrevocation'
        #  'flowwithcachingandrevocation_cached'
        #  'flowwithcachingandrevocation_revoked'
        #  'flowwithcachingandrevocation_cached_revoked'
        #  'challengefirstflow'
        #  'challengefirstflow_cached'
        #  'challengefirstflow_revoked'
        #  'challengefirstflow_cached_revoked'
    )

    $bdidgen = @(
         'static'
        #  'dynamic'
        #  'dynamic_within2s'
    )

    $A1 = ".\lib\authentication\PRx_A\1\$authflowA.pvl"
    $A2 = ".\lib\authentication\PRx_A\2\$authflowA.pvl"
    $B = ".\lib\authentication\PRx_B\$authflowB.pvl"
    $main = ".\privacy_authentication_$bdidgen.pv"
    $command = "proverif -graph .\graph -lib .\lib\decl.pvl -lib $A1 -lib $A2 -lib $B $main"
    Remove-Item -Path .\graph -Recurse
    New-Item -ItemType Directory -Path .\graph
    Start-Process -Filepath "powershell" -ArgumentList "-Command", "$command"
}

Run-ProVerif