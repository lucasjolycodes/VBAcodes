Attribute VB_Name = "M�dulo4"
Sub treinoemail()

    'como escolher a planilha que eu quero enviar
    'Planilha2.Select
    
    'transformando a planilha em PDF, remover ' para funcionar
    'caminhoPDF = "C:\Users\lucas\OneDrive\Documentos\Excel\Planilhatreino.pdf"
    'Sheets("Planilha2").ExportAsFixedFormat Type:=xlTypePDF, Filename:=caminhoPDF, From:=1, to:=1
    
    'declarar variaveis
    Dim email, assunto, nome, anexo As String
    Dim anexos As String
    
    'declarar linhas excel
    Dim linhaInicial, linhaFinal, linha As Integer
    
    'declarar data
    Dim data As Date
        data = Date
    
    'media mensal retirada da "Planilha2" do excel
    media = Sheets("email").Range("D18").Value
    
    'media mensal retirada da "Planilha2" do excel porem utilizando uma celula
    'media = Sheets("Planilha2").Cells("18,4").Value
    
    
    'atribuir valores para as variaveis
    
    'anexo = "caminho do anexo"
    
    'linha inicial do excel
        linhaInicial = 7
    'linha final do excel
        linhaFinal = 7
    
    'estrutura de envio do email
    
    'declarando quais linhas o VBA vai ler
    For linha = linhaInicial To linhaFinal
    'For i = 7 to 10
    
        'celulas que o VBA vai ler (necessario database)
        email = Sheets("email").Range("J" & linha).Value
        nome = Sheets("email").Range("K" & linha).Value
        anexos = Sheets("email").Range("L" & linha).Value
    
    
    
    Planilha2.Select
    caminhoPDF = "C:\Users\lucas\OneDrive\Documentos\Excel\Planilhatreino1.pdf"
    Sheets("email").ExportAsFixedFormat Type:=xlTypePDF, Filename:=caminhoPDF, From:=1, To:=1
    
    'codigo para abrir o outlook
    Set newapp = CreateObject("outlook.application")
    'codigo para clicar automaticamente em enviar e-mail
    Set newMail = newapp.CreateItem(0)
    
    'with substitui o newmail antes de todas variaveis
    'abrindo o with
    With newMail
    
        'exibir o aplicativo do outlook
        .display
        'destinatario do e-mail
        .To = email
        'titulo do e-mail
        .Subject = "Bom dia, " & nome
        'texto que sera enviado junto com o e-mail
        '.body = "bom dia, segue o relat�rio do dia" & " " & data - 1 & ". A m�dia deu " & media & "%"
        'anexos que ser�o enviados juntos com o e-mail
        .attachments.Add anexos
        
        'Necessario para copiar a planilha e colar no e-mail
        With .GetInspector.WordEditor.Windows(1).Selection
        
        .TypeText "testando a " & data
        .TypeParagraph
        
        'Adicionar uma parte da planilha dentro do corpo do e-mail (copiar e colar)
        Sheets("email").Range("D16:D22").Copy
        .Paste
        'send serve para enviar o e-mail automaticamente, remover ' para funcionar
        '.send
        
    End With
        
    'fechando o with
    End With
    
    'tempo de espera para abrir um novo e-mail
    Application.Wait (Now + TimeValue("00:00:05"))
    'o novo e-mail sera resetado para que as novas informa��es sejam adicionadas
    Set newMail = Nothing
    
    'enviar o email utilizando a sequencia de linhas
    Next linha
    'Next i
      
'fechamento do codigo
End Sub
