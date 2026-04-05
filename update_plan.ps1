# PowerShell script to update STM32 files with new content
$files = @{
    '2.LED Toggle Using Bitwise.md' = '3'
    '3.Switch Input → LED Control.md' = '4'
    '4.Software Debouncing.md' = '5'
    '5.LED Binary Counter.md' = '6'
    '5.1.binarywithbutton.md' = '7'
    '6.Buzzer Control (Basic).md' = '8'
    '7.Tone Generation.md' = '9'
    '8.Timer-Based LED Blink.md' = '10'
    '9.External Interrupt (EXTI).md' = '11'
    '10.1.4-bit Mode.md' = '12'
    '10.LCD Interfacing (16x2) Don''t use I2C Module.md' = '13'
}
Write-Host 'Files to update:' -ForegroundColor Green
$files.Keys | ForEach-Object { Write-Host \"  - \" }
