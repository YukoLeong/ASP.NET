Imports System.Xml
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Partial Class SeminarMark
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles upload.Click
        If IsPostBack Then

            ' Dim dv_path_check As Data.DataView = file.Select(New DataSourceSelectArguments)
            'For j As Integer = 0 To dv_path_check.Count - 1
            'If dv_path_check.Item(j).Item("file_name") = Me.FileUpload1.FileName Then
            'Response.Write("<script>alert('This file have been processed, check it again please!')</script>")
            ' Exit Sub
            'End If

            '   Next

            Dim Path As String = Server.MapPath("~/Admin/UploadFile/")
            Dim pic As String = "~/Admin/UploadFile/"
            Dim FileOk As Boolean = False
            Dim fileExtension As String
            Dim k As Integer
            ' Dim flag As Boolean = False
            Dim flagCard As Boolean = False
            If Me.FileUpload1.HasFile Then
                fileExtension = IO.Path.GetExtension(Me.FileUpload1.FileName).ToLower
                Dim allowedExtensions As String() = {".xml"}
                For k = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(k) Then
                        FileOk = True
                    End If
                Next
                If FileOk Then
                    Try


                        Me.FileUpload1.PostedFile.SaveAs(Path & "\" & Me.FileUpload1.FileName)
                        'Me.filefail.Text = "Upload Success!!"



                    Catch ex As Exception
                        Me.filefail.Text = "Upload False!! <br>" + ex.Message
                        Exit Sub

                    End Try
                Else
                    Me.filefail.Text = "file upload failed, confirm the type please !!"
                    Exit Sub
                End If
            End If



            Dim strReader As System.IO.StreamReader


            strReader = New StreamReader(Path + Me.FileUpload1.FileName)


            Dim ds As New DataSet()

            ds.ReadXml(strReader)

            Dim CardCod As New List(Of String)()
            Dim EventID As New List(Of String)()
            Dim CardNoCod As New List(Of String)()
            Dim CardStatus As New List(Of String)()
            Dim CardReg As New List(Of String)()
            Dim VaildEventID As New List(Of String)()
            Dim fail As Integer = 0



            Dim PathDirHistroy As String = "~/Admin/semlog/"
            Dim strArrHistroy() As String
            strArrHistroy = Me.FileUpload1.FileName.Split(".")

            Dim FilePathHistroy As String = Server.MapPath(PathDirHistroy + strArrHistroy(0) + "_" + DateTime.Now.ToString("yyyy_MM_dd_HHmmss") + ".csv")

            Using swHistroy As StreamWriter = New StreamWriter(FilePathHistroy)
                swHistroy.Write("eventID" + "," + "cardSN" + "," + "status" + "," + "registerTime" + "," + "process" + swHistroy.NewLine)





                For i As Integer = 0 To ds.Tables(0).Rows.Count - 1

                    Try
                        Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                        Using mycon As New SqlConnection(con)
                            mycon.Open()
                            Dim strSQL As String = "select top 1 student_academic_info.pess_cod from student_academic_info,MemberCurrentCard "
                            strSQL += "where student_academic_info.NETID=MemberCurrentCard.member_id and MemberCurrentCard.card_snr=@card_snr"

                            Using cmd As New SqlCommand()
                                cmd.Connection = mycon
                                cmd.CommandText = strSQL
                                cmd.Parameters.AddWithValue("card_snr", ds.Tables(0).Rows(i)("cardSN").ToString())

                                Dim reader As SqlDataReader = cmd.ExecuteReader()
                                If reader.HasRows Then
                                    While reader.Read()
                                        CardCod.Add(reader("PESS_COD").ToString())

                                        VaildEventID.Add(ds.Tables(0).Rows(i)("eventID").ToString())
                                        swHistroy.Write(ds.Tables(0).Rows(i)("eventID").ToString() + "," + ds.Tables(0).Rows(i)("cardSN").ToString() + "," + ds.Tables(0).Rows(i)("status").ToString() + "," + ds.Tables(0).Rows(i)("registerTime").ToString() + "," + "Success" + swHistroy.NewLine)
                                    End While
                                Else
                                    flagCard = True
                                    EventID.Add(ds.Tables(0).Rows(i)("eventID").ToString())
                                    CardNoCod.Add(ds.Tables(0).Rows(i)("cardSN").ToString())
                                    CardStatus.Add(ds.Tables(0).Rows(i)("status").ToString())
                                    CardReg.Add(ds.Tables(0).Rows(i)("registerTime").ToString())
                                    fail = fail + 1
                                    swHistroy.Write(ds.Tables(0).Rows(i)("eventID").ToString() + "," + ds.Tables(0).Rows(i)("cardSN").ToString() + "," + ds.Tables(0).Rows(i)("status").ToString() + "," + ds.Tables(0).Rows(i)("registerTime").ToString() + "," + "Fail" + swHistroy.NewLine)
                                End If
                            End Using
                            mycon.Close()
                        End Using

                    Catch ex As Exception
                        Response.Write("<script>alert('Web Error!')</script>")
                        Exit Sub
                    End Try


                    If flagCard = False Then



                        Dim conn As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString)
                        Dim tmp_da7 As New SqlClient.SqlDataAdapter("Select top 1 * from Learning_Records_Correspond where pess_cod='" & CardCod(i) & "'", conn)

                        Dim tmp_ds As New DataSet


                        conn.Open()
                        Dim dv_Learning_Experience As Data.DataView = attribute.Select(New DataSourceSelectArguments)
                        tmp_da7.Fill(tmp_ds, "Learning_Records_Correspond")
                        tmp_da7.FillSchema(tmp_ds, SchemaType.Source, "Learning_Records_Correspond")
                        If tmp_ds.Tables("Learning_Records_Correspond").Rows.Count = 0 Then


                            For g As Integer = 0 To dv_Learning_Experience.Count - 1

                                Try
                                    Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                                    Using mycon As New SqlConnection(con)
                                        mycon.Open()
                                        Dim strSQL As String = "insert into Learning_Records_Correspond(pess_cod,experience_id,count)values(@pess_cod,@experience_id,@count);"

                                        Using cmd As New SqlCommand()
                                            cmd.Connection = mycon
                                            cmd.CommandText = strSQL
                                            cmd.Parameters.AddWithValue("@pess_cod", CardCod(i))
                                            cmd.Parameters.AddWithValue("@experience_id", dv_Learning_Experience.Item(g).Item("id"))
                                            cmd.Parameters.AddWithValue("@count", "0")
                                            cmd.ExecuteNonQuery()
                                        End Using
                                        mycon.Close()
                                    End Using
                                Catch ex As Exception

                                    Response.Write("<script>alert('Web Error!')</script>")

                                    Exit Sub

                                End Try

                            Next
                        End If






                        Try
                            Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                            Using mycon As New SqlConnection(con)
                                mycon.Open()
                                Dim sql As String = "insert into Seminar(pess_cod,Seminar_info_id,register_time,Operator)values(@pess_cod,@Seminar_info_id,@register_time,@Operator);"
                                sql += "update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='1')"
                                Using cmd As New SqlCommand()
                                    Dim transaction As SqlTransaction = mycon.BeginTransaction()
                                    cmd.Connection = mycon
                                    cmd.Transaction = transaction
                                    Try
                                        cmd.CommandText = sql

                                        cmd.Parameters.AddWithValue("@pess_cod", CardCod(i))
                                        cmd.Parameters.AddWithValue("@Seminar_info_id", ds.Tables(0).Rows(i)("eventID").ToString())
                                        cmd.Parameters.AddWithValue("@register_time", ds.Tables(0).Rows(i)("registerTime").ToString())
                                        cmd.Parameters.AddWithValue("@Operator", "garychan")



                                        cmd.ExecuteNonQuery()
                                        transaction.Commit()


                                    Catch ex As Exception
                                        ' flag = True


                                        Try
                                            transaction.Rollback()

                                        Catch ex2 As Exception

                                            Response.Write("<script>alert('db server Error!')</script>")
                                        End Try
                                    End Try
                                End Using
                                mycon.Close()
                            End Using
                        Catch ex As Exception
                            Response.Write("<script>alert('Web Error!')</script>")
                        End Try
                    End If
                Next

                swHistroy.Close()


            End Using
            ' If flagCard = False Then


            Try
                Dim con As String = ConfigurationManager.ConnectionStrings("EPConnectionString").ConnectionString
                Using mycon As New SqlConnection(con)
                    mycon.Open()
                    Dim strSQL As String = "insert into SeminarProcess(seminar_id,file_name,total,success,fail,process_date)values(@seminar_id,@file_name,@total,@success,@fail,getDate())"


                    Using cmd As New SqlCommand()
                        cmd.Connection = mycon
                        cmd.CommandText = strSQL
                        cmd.Parameters.AddWithValue("@seminar_id", VaildEventID(0))
                        cmd.Parameters.AddWithValue("@file_name", Me.FileUpload1.FileName)
                        cmd.Parameters.AddWithValue("@total", ds.Tables(0).Rows.Count)
                        cmd.Parameters.AddWithValue("@success", ds.Tables(0).Rows.Count - fail)
                        cmd.Parameters.AddWithValue("@fail", fail)
                        cmd.ExecuteNonQuery()
                    End Using
                    mycon.Close()
                End Using

            Catch ex As Exception
                Response.Write("<script>alert('Web Error!')</script>")
            End Try
            Me.filefail.Text = "Upload Success!!"
            detail.Visible = False
            'End If
            If CardNoCod.Count <> 0 Then

                Dim PathDir As String = "~/Admin/semInvaild/"
                Dim strArr() As String
                strArr = Me.FileUpload1.FileName.Split(".")

                Dim FilePath As String = Server.MapPath(PathDir + strArr(0) + "_" + DateTime.Now.ToString("yyyy_MM_dd_HHmmss") + ".csv")

                Using sw As StreamWriter = New StreamWriter(FilePath)
                    sw.Write("eventID" + "," + "cardSN" + "," + "status" + "," + "registerTime" + "," + "process" + sw.NewLine)
                    For i As Integer = 0 To CardNoCod.Count - 1

                        sw.Write(EventID(i) + "," + CardNoCod(i) + "," + CardStatus(i) + "," + CardReg(i) + "," + "Fail" + sw.NewLine)

                    Next

                    sw.Close()
                End Using
                Me.filefail.Text = "This file contain some invaild student!"
                detail.Visible = True
                detail.Text = "Detail"
                detail.NavigateUrl = PathDir + strArr(0) + "_" + DateTime.Now.ToString("yyyy_MM_dd_HHmmss") + ".csv"
            End If
            strReader.Close()

        End If

    End Sub
End Class


