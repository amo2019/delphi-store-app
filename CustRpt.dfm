�
 TCUSTOMERBYINVOICEREPORT 0   TPF0TCustomerByInvoiceReportCustomerByInvoiceReportLeft Top Width�HeightMFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetMastData.CustByLastInvQueryFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinFirstPrintIfEmpty
SnapToGrid	UnitsNativeZoomP TQRBandDetailBand1Left&Top� Width@Height#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ForceNewColumnForceNewPage
ParentFontSize.Values��������@�������	@ BandTyperbDetail TQRExprQRExpr1LeftRTopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU��@������J�@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchFont.CharsetARABIC_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
ExpressionHAddr1 + if(Addr2 <> '',' ' + Addr2, '') + if(City <> '',', ' + City, '')FontSize
  	TQRDBText	QRDBText2LeftRTopWidth<HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values��������@UUUUUU��@      ��@      p�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetMastData.CustByLastInvQuery	DataFieldCompanyFont.CharsetARABIC_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  	TQRDBText	QRDBText3Left�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������	@������J�@      p�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetMastData.CustByLastInvQuery	DataFieldPhoneTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4Left�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������	@������J�@������J�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetMastData.CustByLastInvQuery	DataFieldFAXTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftTopWidth#HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@�����*��	@������J�@��������@ 	AlignmenttaRightJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetMastData.CustByLastInvQuery	DataFieldCustNoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText1LeftTopWidthEHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�/UUUU5�@      ��@痪���J�@      4�@ 	AlignmenttaCenterAlignToBandAutoSizeAutoStretchColorclWhiteDataSetMastData.CustByLastInvQuery	DataFieldLastInvoiceDateOnPrintQRDBText1PrintTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left&TophWidth@Height#Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameArial
Font.StylefsBold ForceNewColumnForceNewPage
ParentFontSize.Values��������@�������	@ BandTyperbColumnHeader TQRLabelQRLabel4LeftTopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@������J�@��������@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionLast InvoiceColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel5LeftRTopWidth8HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@UUUUUU��@�������� @TUUUUU5�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCustomerColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel6LeftRTopWidth/HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@UUUUUU��@��������@UUUUUUq�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionAddressColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel7Left�TopWidth&HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@��������	@�������� @������Z�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPhoneColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel8Left�TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@��������	@��������@������"�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionFAXColor	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel9Left�TopWidthNHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@TUUUU���	@��������@      ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCustomer No.Color	clSkyBlueFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize   TQRBand
TitleBand1Left&Top&Width@HeightBFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      H�@�������	@ BandTyperbPageHeader TQRLabelQRLabel1Left TopWidth� Height-Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      Ԕ@          ��������@UUUUUU+�@ 	AlignmenttaLeftJustifyAlignToBand	AutoSize	AutoStretchCaptionJoush Main StoresColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBoldfsItalic 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2Left� TopWidthrHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������J�@      ��@TUUUUU5�@      ��@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaptionCustomer ListColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel3Left� TopWidthTHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      p�@      f�@      ��@      �@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaptionBy Last InvoiceColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize    