#variavel responsavel pelo caminho do txt que ira conter o nome do computador que nao esta disponivel
$computerhost = Get-Content C:\temp\host.txt

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$objForm = New-Object System.Windows.Forms.Form     #Declaração de um novo objeto
#$objForm.Text = "Data Entry Form"     #Tidulo do objeto, não é necessario neste projeto desta forma esta comentado
$objForm.Size = New-Object System.Drawing.Size(1000,200)     #Tamanho do objeto
$objForm.StartPosition = "CenterScreen"     #Posição do objeto

$objForm.KeyPreview = $True
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Enter") 
    {$x=$objTextBox.Text;$objForm.Close()}})
$objForm.Add_KeyDown({if ($_.KeyCode -eq "Escape") 
    {$objForm.Close()}})

$objLabel = New-Object System.Windows.Forms.Label     #Declaração de nobo objeto tipo label
$objLabel.Location = New-Object System.Drawing.Size(0,0)     #Posicao do Label
$objLabel.Size = New-Object System.Drawing.Size(1000,200)    #Tamanho do Label
$objLabel.Text = "Servidor $computerhost Indisponivel"     #Mensagem que irá aparecer no alerta
$objLabel.TextAlign = "MiddleCenter"     #Alinhamento do texto
$objForm.Controls.Add($objLabel)

$Font = New-Object System.Drawing.Font("Calibri",40,[System.Drawing.FontStyle]::Bold)    #Parametros para fonte

$objForm.BackColor = 'Red'
$objForm.ForeColor = 'Yellow'
$objForm.Font = $Font
$objForm.Add_Shown({$objForm.Activate()})
$objForm.Topmost = $True
$objForm.ControlBox = $false
[void]$objForm.Show()

#Tempo do alerta, com mudança no background e font-color da mensagem
for($i = 0; $i -lt 15; $i++) {

Start-Sleep -Milliseconds 200

$objForm.BackColor = 'Yellow'
$objForm.ForeColor = 'Red'

Start-Sleep -Milliseconds 200

$objForm.BackColor = 'Red'
$objForm.ForeColor = 'Yellow'

}

[void]$objForm.Close()
