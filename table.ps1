<#
 # Make a table of results.
 #
 # > powershell.exe -ExecutionPolicy RemoteSigned -File .\table.ps1 <target_dir>
 #>
 $authflow = @(
    'baseline'
    'extended'
    'simpleflow'
    'flowwithcaching'
    'flowwithcaching_cached'
    'flowwithcachingandrevocation'
    'flowwithcachingandrevocation_cached'
    'flowwithcachingandrevocation_revoked'
    'flowwithcachingandrevocation_cached_revoked'
    'challengefirstflow'
    'challengefirstflow_cached'
    'challengefirstflow_revoked'
    'challengefirstflow_cached_revoked'
)

$bdidgen = @(
    'static'
    'dynamic_within2s'
    'dynamic'
)

$targetDir = $Args[0]
$outfile = "$targetDir\result_table.md"
$suppress = New-Item -Path . -Name $outfile -ItemType "file"
Set-Content -Path .\$outfile -Encoding utf8 -Value "| 1st | 2nd | BDID | Privacy |"
Add-Content -Path .\$outfile -Encoding utf8 -Value "| --- | --- | --- | --- |"

foreach ( $bdid in $bdidgen )
{
    foreach ( $flow1 in $authflow )
    {
        foreach ( $flow2 in $authflow )
        {
            $summary = Select-String -Path "$targetDir\$bdid\$flow1\$flow2\result.txt" -Pattern "Verification summary:" -Context 0,2
            if ($summary.Context.PostContext[1].contains("true"))
            {
                # Observational equivalence is true.
                Add-Content -Path .\$outfile -Encoding utf8 -Value "| $flow1 | $flow2 | $bdid | O |"
            }
            else
            {
                # Observational equivalence cannot be proved.
                Add-Content -Path .\$outfile -Encoding utf8 -Value "| $flow1 | $flow2 | $bdid | X |"
            }
        }
    }
}