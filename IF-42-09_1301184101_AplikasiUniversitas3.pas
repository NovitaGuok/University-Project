Program TuBes;
uses crt;
{Aplikasi ini digunakan oleh panitia USM dan para siswa. Data yang diolah adalah data perguruan 
tinggi beserta jurusan dan passing grade. Siswa bisa melihat data-data perguruan tinggi yang ada.}
TYPE pt = record
    nama_pt, fak, prov, kot: string;
    akred_pt: char;
end;

TYPE pt_fak = record
    nama_fak, jur: string;
end;

TYPE fak_jur = record
    nama_jur: string;
    pass_grd: real;
    akred_jur: char;
end;

TYPE adm = record
    adm_name, adm_pw: string;
end;

TYPE arr_pt = array [1..100] of pt;

TYPE arr_fak = array [1..100] of pt_fak;

TYPE arr_jur = array [1..100] of fak_jur;

TYPE arr_adm = array [1..10] of adm;

var
    login: integer;
    perTing: arr_pt;
    fakultas: arr_fak;
    jurusan: arr_jur;
    adm_data: arr_adm;
    i, a: integer;
    cont_adm, cont_user, cont: char;

//----------------------GENERAL------------------------

procedure view_data(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan semua data perguruan tinggi}
var 
    n: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    n := 1;
    if (i = 0) then
        writeln('-------------No data entry------------')
    else
    begin
    while (n <= i) do
    begin 
        writeln(n,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
        n := n + 1;
    end;
    end;
end;

//-----------------------USER SPACE-------------------------

procedure sort_byName (i: integer; var perTing: arr_pt; var fakultas: arr_fak; var jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Nama perguruan tinggi terurut sesuai abjad pertama}
var 
    j, k, min: integer;
    temp1: pt;
    temp2: pt_fak;
    temp3: fak_jur;
begin
    j := 1;
    while (j <= i-1) do
    begin
        min := j;
        k := j + 1;
        while (k <= i) do
        begin
            if (perTing[k].nama_pt[1] < perTing[min].nama_pt[1]) then
                min := k;
            k := k + 1;
        end;
        temp1 := perTing[j];
        perTing[j] := perTing[min];
        perTing[min] := temp1;
        temp2 := fakultas[j];
        fakultas[j] := fakultas[min];
        fakultas[min] := temp2;
        temp3 := jurusan[j];
        jurusan[j] := jurusan[min];
        jurusan[min] := temp3;
        j := j + 1;
    end;
end;

procedure sort_accA (i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai urutan akreditasi perguruan tinggi secara menaik}
var
    l: char;
    found: Boolean;
    j, k, n: integer;
    t1: pt;
    t2: pt_fak;
    t3: fak_jur;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    sort_byName(i, perTing, fakultas, jurusan);
    j := 2;
    while (j <= i) do
    begin
        l := perTing[j].akred_pt;
        t1 := perTing[j];
        t2 := fakultas[j];
        t3 := jurusan[j];
        k := j - 1;
        found := false;
        while ((k >= 1) and (not found)) do
        begin
            if (l < perTing[k].akred_pt) then
            begin
                perTing[k+1] := perTing[k];
                fakultas[k+1] := fakultas[k];
                jurusan[k+1] := jurusan[k];
                k := k - 1;
            end
            else
                found := true; 
        end;
        perTing[k+1] := t1;
        fakultas[k+1] := t2;
        jurusan[k+1] := t3;
        j := j + 1;
    end;
    n := 1;
    while (n <= i) do
    begin 
        writeln(n,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
        n := n + 1;
    end;
end;    

procedure sort_accD(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai urutan akreditasi perguruan tinggi secara menurun}
var
    l: char;
    found: Boolean;
    j, k, n: integer;
    t1: pt;
    t2: pt_fak;
    t3: fak_jur;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    sort_byName(i, perTing, fakultas, jurusan);
    j := 2;
    while (j <= i) do
    begin
        l := perTing[j].akred_pt;
        t1 := perTing[j];
        t2 := fakultas[j];
        t3 := jurusan[j];
        k := j - 1;
        found := false;
        while ((k >= 1) and (not found)) do
        begin
            if (l > perTing[k].akred_pt) then
            begin
                perTing[k+1] := perTing[k];
                fakultas[k+1] := fakultas[k];
                jurusan[k+1] := jurusan[k];
                k := k - 1;
            end
            else
                found := true; 
        end;
        perTing[k+1] := t1;
        fakultas[k+1] := t2;
        jurusan[k+1] := t3;
        j := j + 1;
    end; 
    n := 1;
    while (n <= i) do
    begin 
        writeln(n,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
        n := n + 1;
    end;
end;

procedure sort_pgA(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai urutan passing grade jurusan suatu perguruan tinggi secara menaik}
var
    j, k, min, n: integer;
    temp1: pt;
    temp2: pt_fak;
    temp3: fak_jur;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    sort_byName(i, perTing, fakultas, jurusan);
    j := 1;
    while (j <= i-1) do
    begin
        min := j;
        k := j + 1;
        while (k <= i) do
        begin
            if (jurusan[k].pass_grd < jurusan[min].pass_grd) then
                min := k;
            k := k + 1;
        end;
        temp1 := perTing[j];
        perTing[j] := perTing[min];
        perTing[min] := temp1;
        temp2 := fakultas[j];
        fakultas[j] := fakultas[min];
        fakultas[min] := temp2;
        temp3 := jurusan[j];
        jurusan[j] := jurusan[min];
        jurusan[min] := temp3;
        j := j + 1;
    end;
    n := 1;
    while (n <= i) do
    begin 
        writeln(n,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
        n := n + 1;
    end;
end;

procedure sort_pgD(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai urutan passing grade jurusan suatu perguruan tinggi secara menurun}
var
    j, k, min, n: integer;
    temp1: pt;
    temp2: pt_fak;
    temp3: fak_jur;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    sort_byName(i, perTing, fakultas, jurusan);
    j := 1;
    while (j <= i-1) do
    begin
        min := i;
        k := j;
        while (k <= i) do
        begin
            if (jurusan[k].pass_grd > jurusan[min].pass_grd) then
                min := k;
            k := k + 1;
        end;
        temp1 := perTing[j];
        perTing[j] := perTing[min];
        perTing[min] := temp1;
        temp2 := fakultas[j];
        fakultas[j] := fakultas[min];
        fakultas[min] := temp2;
        temp3 := jurusan[j];
        jurusan[j] := jurusan[min];
        jurusan[min] := temp3;
        j := j + 1;
    end;
    n := 1;
    while (n <= i) do
    begin 
        writeln(n,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
        n := n + 1;
    end;
end;

procedure city_search(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai kota yang dicari}
var 
    n, ord: integer;
    univCity: string;
    uSearch: Boolean;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    write('What do you want to search for? ');
    readln(univCity);
    if (i = 0) then 
        view_data(i, perTing, fakultas, jurusan)
    else
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        n := 1;
        ord := 0;
        uSearch := false;
        while (n <= i) do
        begin    
            if (univCity = perTing[n].kot) then
            begin   
                uSearch := true;
                ord := ord + 1;
                writeln(ord,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
            end;
            n := n + 1;
        end;
    end;
    if (uSearch = false) then
    begin
        clrscr;
        writeln;
        writeln('------------Data not exist!-----------');
    end;
end;

procedure name_search(i: integer; perTing: arr_pt; fakultas: arr_fak; jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menampilkan data perguruan tinggi sesuai nama yang dicari}
var 
    n, ord: integer;
    univName: string;
    uSearch: Boolean;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    write('What do you want to search for? ');
    readln(univName);
    if (i = 0) then 
        view_data(i, perTing, fakultas, jurusan)
    else 
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        n := 1;
        ord := 0;
        uSearch := false;
        while (n <= i) do
        begin  
            if (univName = perTing[n].nama_pt) then
            begin   
                uSearch := true;
                ord := ord + 1;
                writeln(ord,'. ',perTing[n].nama_pt,' || ',perTing[n].akred_pt,' || ',perTing[n].prov,' || ',perTing[n].kot,' || ',fakultas[n].nama_fak,' || ',jurusan[n].nama_jur,' || ',(jurusan[n].pass_grd):0:2,' || ',jurusan[n].akred_jur);
            end;
            n := n + 1;
        end;
        if (uSearch = false) then
        begin
            clrscr;
            writeln;
            writeln('------------Data not exist!-----------');
        end;
    end;
end;

procedure user_search();
var
    search_opt: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('Do you want to search by');
    writeln('1. Name');
    writeln('2. City');
    write('Option (1/2): ');
    readln(search_opt);
    if(search_opt = 1) then
        name_search(i, perTing, fakultas, jurusan)
    else if(search_opt = 2) then
        city_search(i, perTing, fakultas, jurusan);
end;

procedure login_user(i: integer);
var 
    user_task, sort_opt: integer;
    ad_opt: char;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('What do you want to do?');
    writeln('1. See all universities');
    writeln('2. Search universities');
    write('Option(1/2): ');
    readln(user_task);
    if (user_task = 1) then
    begin
        if (i = 0) then 
            view_data(i, perTing, fakultas, jurusan)
        else
        begin
            view_data(i, perTing, fakultas, jurusan);
            writeln;
            writeln('Sorting option: ');
            writeln('1. By passing grade');
            writeln('2. By universities'' accreditation');
            writeln('3. None');
            write('Option (1/2/3): ');
            readln(sort_opt);
            if (sort_opt = 1) then
            begin
                writeln;
                write('Sort in ascending or descending (A/D)? ');
                readln(ad_opt);
                if (ad_opt = 'A') or (ad_opt = 'a') then
                begin
                    sort_pgA(i, perTing, fakultas, jurusan);
                end
                else if (ad_opt = 'D') or (ad_opt = 'd') then
                begin
                    sort_pgD(i, perTing, fakultas, jurusan);
                end;
            end
            else if (sort_opt = 2) then
            begin
                writeln;
                write('Sort in ascending or descending (A/D)? ');
                readln(ad_opt);
                if (ad_opt = 'A') or (ad_opt = 'a') then
                begin
                    sort_accA(i, perTing, fakultas, jurusan);
                end
                else if (ad_opt = 'D') or (ad_opt = 'd') then
                begin
                    sort_accD(i, perTing, fakultas, jurusan);
                end;
            end;
        end;
    end
    else if (user_task = 2) then
        user_search();
end;

//----------------------ADMIN SPACE------------------------

procedure adm_del(var i: integer; var perTing: arr_pt; var fakultas: arr_fak; var jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Menghapus sebaris data perguruan tinggi yang dipilih}
var
    del_row, n, new: integer;
begin
    if (i = 0) then 
        view_data(i, perTing, fakultas, jurusan)
    else 
    begin
        view_data(i, perTing, fakultas, jurusan);
        writeln;
        write('Which row of data do you want to delete? ');
        readln(del_row);
        n := 1;
        new := 1;
        while (new <= i) do
        begin
            if (n <> del_row) then
            begin
                perTing[new].nama_pt := perTing[n].nama_pt;
                perTing[new].akred_pt := perTing[n].akred_pt;
                perTing[new].prov := perTing[n].prov;
                perTing[new].kot := perTing[n].kot;
                fakultas[new].nama_fak := fakultas[n].nama_fak;
                jurusan[new].nama_jur := jurusan[n].nama_jur;
                jurusan[new].pass_grd := jurusan[n].pass_grd;
                jurusan[new].akred_jur := jurusan[n].akred_jur;
            end
            else
            begin
                perTing[new].nama_pt := perTing[n+1].nama_pt;
                perTing[new].akred_pt := perTing[n+1].akred_pt;
                perTing[new].prov := perTing[n+1].prov;
                perTing[new].kot := perTing[n+1].kot;
                fakultas[new].nama_fak := fakultas[n+1].nama_fak;
                jurusan[new].nama_jur := jurusan[n+1].nama_jur;
                jurusan[new].pass_grd := jurusan[n+1].pass_grd;
                jurusan[new].akred_jur := jurusan[n+1].akred_jur;
                i := i - 1;
                n := n + 1;
            end;
            n := n + 1;
            new := new + 1;   
        end;
        writeln;
        writeln('------Data deleted successfully!------');
        writeln;
        view_data(i, perTing, fakultas, jurusan);
    end;
end;

procedure adm_edit(var i: integer; var perTing: arr_pt; var fakultas: arr_fak; var jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i
F.S. Mengedit data perguruan tinggi berdasarkan data tunggal (nama, kota, jurusan, dll)}
var 
    ed_row, ed_opt, j: integer;
    ed_cont: char;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    if (i = 0) then 
        view_data(i, perTing, fakultas, jurusan)
    else 
    begin
        view_data(i, perTing, fakultas, jurusan);
        writeln;
        write('Which row of data do you want to edit? ');
        readln(ed_row);
        writeln;
        writeln('Replace option: ');
        writeln('1. University');
        writeln('2. University''s accreditation');
        writeln('3. Province');
        writeln('4. City');
        writeln('5. Faculty name');
        writeln('6. Major');
        writeln('7. Passing grade');
        writeln('8. Major''s accreditation');
        write('Option (1-8): ');
        readln(ed_opt);
        write('Replace with: ');
        if (ed_opt = 1) then
            readln(perTing[ed_row].nama_pt)
        else if (ed_opt = 2) then
            readln(perTing[ed_row].akred_pt)
        else if (ed_opt = 3) then
            readln(perTing[ed_row].prov)
        else if (ed_opt = 4) then
            readln(perTing[ed_row].kot)
        else if (ed_opt = 5) then
            readln(fakultas[ed_row].nama_fak)
        else if (ed_opt = 6) then
            readln(jurusan[ed_row].nama_jur)
        else if (ed_opt = 7) then
            readln(jurusan[ed_row].pass_grd)
        else if (ed_opt = 8) then
            readln(jurusan[ed_row].akred_jur);
        j := 1;
        while (j < i) do
        begin
            if (perTing[j].nama_pt = perTing[i].nama_pt) and (perTing[j].akred_pt = perTing[i].akred_pt) and (perTing[j].prov = perTing[i].prov) and (perTing[j].kot = perTing[i].kot) and (fakultas[j].nama_fak = fakultas[i].nama_fak) and (jurusan[j].nama_jur = jurusan[i].nama_jur) and (jurusan[j].pass_grd = jurusan[i].pass_grd) and (jurusan[j].akred_jur = jurusan[i].akred_jur) then
            begin
                perTing[i] := perTing[j];
                i := i - 1;
            end;
            j := j + 1;
        end;
        writeln;
        writeln('-------Data edited successfully!------');
        writeln;
        view_data(i, perTing, fakultas, jurusan);
        writeln;
        write('Do you want to edit data again (Y/N)? ');
        readln(ed_cont);
        if (ed_cont = 'Y') or (ed_cont = 'y') then
        repeat
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            view_data(i, perTing, fakultas, jurusan);
            writeln;
            write('Which row of data do you want to edit? ');
            readln(ed_row);
            writeln;
            writeln('Replace option: ');
            writeln('1. University');
            writeln('2. University''s accreditation');
            writeln('3. Province');
            writeln('4. City');
            writeln('5. Faculty name');
            writeln('6. Major');
            writeln('7. Passing grade');
            writeln('8. Major''s accreditation');
            write('Option (1-8): ');
            readln(ed_opt);
            write('Replace with: ');
            if (ed_opt = 1) then
                readln(perTing[ed_row].nama_pt)
            else if (ed_opt = 2) then
                readln(perTing[ed_row].akred_pt)
            else if (ed_opt = 3) then
                readln(perTing[ed_row].prov)
            else if (ed_opt = 4) then
                readln(perTing[ed_row].kot)
            else if (ed_opt = 5) then
                readln(fakultas[ed_row].nama_fak)
            else if (ed_opt = 6) then
                readln(jurusan[ed_row].nama_jur)
            else if (ed_opt = 7) then
                readln(jurusan[ed_row].pass_grd)
            else if (ed_opt = 8) then
                readln(jurusan[ed_row].akred_jur);
            j := 1;
            while (j < i) do
            begin
                if (perTing[j].nama_pt = perTing[i].nama_pt) and (perTing[j].akred_pt = perTing[i].akred_pt) and (perTing[j].prov = perTing[i].prov) and (perTing[j].kot = perTing[i].kot) and (fakultas[j].nama_fak = fakultas[i].nama_fak) and (jurusan[j].nama_jur = jurusan[i].nama_jur) and (jurusan[j].pass_grd = jurusan[i].pass_grd) and (jurusan[j].akred_jur = jurusan[i].akred_jur) then
                begin
                    perTing[i] := perTing[j];
                    i := i - 1;
                end;
                j := j + 1;
            end;
            writeln;
            writeln('-------Data edited successfully!------');
            writeln;
            view_data(i, perTing, fakultas, jurusan);
            writeln;
            write('Do you want to edit data again (Y/N)? ');
            readln(ed_cont);
        until (ed_cont = 'N') or (ed_cont = 'n');
    end;
end;

procedure adm_add(var i: integer; var perTing: arr_pt; var fakultas: arr_fak; var jurusan: arr_jur);
{I.S. Terdefinisi data perguruan tinggi sebanyak i, mungkin kosong
F.S. Data perguruan tinggi bertambah/terisi} 
var 
    n, n_add, j: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    write('How many data(s) do you want to add? ');
    readln(n_add);
    n := 1;
    while (n <= n_add) do
    begin
        i := i + 1;
        writeln('(',i,')===================================');
        write('University                  : ');
        readln(perTing[i].nama_pt);
        write('University''s accreditation  : ');
        readln(perTing[i].akred_pt);
        write('Province                    : ');
        readln(perTing[i].prov);
        write('City                        : ');
        readln(perTing[i].kot);
        write('Faculty name                : ');
        readln(fakultas[i].nama_fak);
        write('Major                       : ');
        readln(jurusan[i].nama_jur);
        write('Passing grade (in %)        : ');
        readln(jurusan[i].pass_grd);
        write('Major''s accreditation       : ');
        readln(jurusan[i].akred_jur);
        writeln;
        writeln('------Data inserted successfully!-----');
        j := 1;
        while (j < i) do
        begin
            if (perTing[j].nama_pt = perTing[i].nama_pt) and (perTing[j].akred_pt = perTing[i].akred_pt) and (perTing[j].prov = perTing[i].prov) and (perTing[j].kot = perTing[i].kot) and (fakultas[j].nama_fak = fakultas[i].nama_fak) and (jurusan[j].nama_jur = jurusan[i].nama_jur) and (jurusan[j].pass_grd = jurusan[i].pass_grd) and (jurusan[j].akred_jur = jurusan[i].akred_jur) then
            begin
                perTing[i] := perTing[j];
                i := i - 1;
            end;
            j := j + 1;
        end;
        n := n + 1;
    end;
end;

procedure adm_list(adm_data: arr_adm; var a: integer);
{I.S. Terdefinisi data admin sebanyak a
F.S. Menampilkan semua admin}
var 
    n: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    n := 1;
    if (a = 0) then
        writeln('-------------No data entry------------')
    else
    begin
    while (n <= a) do
    begin 
        writeln(n,'. ',adm_data[n].adm_name);
        n := n + 1;
    end;
    end;
end;

procedure adtask(var i: integer);
var
    adm_task: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('What do you want to do?');
    writeln('1. Add information(s)');
    writeln('2. Edit information(s)');
    writeln('3. Delete information');
    writeln('4. Log Out');
    write('Option: ');
    readln(adm_task);
    if (adm_task = 1) then
        adm_add(i, perTing, fakultas, jurusan)
    else if (adm_task = 2) then 
        adm_edit(i, perTing, fakultas, jurusan)
    else if (adm_task = 3) then 
        adm_del(i, perTing, fakultas, jurusan)
    else if (adm_task = 4) then
        clrscr;
end;

procedure listDel(var adm_data: arr_adm; var a: integer);
{I.S. Terdefinisi data admin sebanyak a
F.S. Menghapus sebuah admin}
var
    del_row, n, new: integer;
    pw: string;
begin
    if (a = 0) then
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        writeln('-------------No data entry------------');
    end
    else 
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        adm_list(adm_data, a);
        writeln;
        write('Which admin do you want to delete? ');
        readln(del_row);
        write('Input password: ');
        readln(pw);
        if (pw = adm_data[del_row].adm_pw) then
        begin
            n := 1;
            new := 1;
            while (new <= a) do
            begin
                if (n <> del_row) then
                begin
                    adm_data[new].adm_name := adm_data[n].adm_name;
                    adm_data[new].adm_pw := adm_data[n].adm_pw;
                end
                else
                begin
                    adm_data[new].adm_name := adm_data[n+1].adm_name;
                    adm_data[new].adm_pw := adm_data[n+1].adm_pw;
                    a := a - 1;
                    n := n + 1;
                end;
                n := n + 1;
                new := new + 1;   
            end;
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('------Data deleted successfully!------');
            writeln;
            adm_list(adm_data, a);
        end
        else
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('------------Wrong password!-----------');
        end;
    end;
end;

procedure listEdit(var adm_data: arr_adm; a: integer);
{I.S. Terdefinisi data admin sebanyak a
F.S. Mengedit semua data admin (username dan/atau password)}
var 
    ed_row: integer;
    pw: string;
begin
    if (a = 0) then
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        writeln('-------------No data entry------------');
    end
    else 
    begin
        adm_list(adm_data, a);
        writeln;
        write('Which admin do you want to edit? ');
        readln(ed_row);
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        write('Input password: ');
        readln(pw);
        if (pw = adm_data[ed_row].adm_pw) then
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('Type new');
            write('-Username : ');
            readln(adm_data[ed_row].adm_name);
            write('-Password : ');
            readln(adm_data[ed_row].adm_pw);
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('-------Data edited successfully!------');
        end
        else
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('------------Wrong password!-----------');
        end;
    end;
end;

procedure adm_reg(var adm_data: arr_adm; var a: integer);
{I.S. Terdefinisi data admin sebanyak a, mungkin kosong
F.S. Admin bertambah/terisi}
var
    j, k: integer;
    admin: Boolean;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('--------------------------------------');
    writeln('------------Register Page-------------');
    writeln('--------------------------------------');
    writeln;
    writeln('Input your ');
    if (a < 1) then
    begin
        a := a + 1;
        write('-Username : ');
        readln(adm_data[a].adm_name);
        write('-Password : ');
        readln(adm_data[a].adm_pw);
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        writeln('-------Registered successfully!-------');
    end
    else if (a >= 1) then
    begin
        a := a + 1;
        write('Username : ');
        readln(adm_data[a].adm_name);
        write('Password : ');
        readln(adm_data[a].adm_pw);
        j := 1;
        while (j <= a) do
        begin
            k := 1;
            while (k < j) do
            begin
                if (adm_data[k].adm_name = adm_data[j].adm_name) and (adm_data[k].adm_pw = adm_data[j].adm_pw) then
                begin
                    admin := false;
                    a := a - 1;
                end;
                k := k + 1;
            end;
            
            j := j + 1;
        end;   
        if (admin = false) then
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('--------Username already exist!-------');
        end
        else
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('-------Registered successfully!-------'); 
        end;
    end;
end;

procedure adm_log(var i: integer);
{I.S. Terdefinisi data admin sebanyak a
F.S. Menuju menu selanjutnya jika username dan password admin sesuai, dan kembali ke menu jika username dan/atau password tidak sesuai data}
var
    j: integer;
    name, pw: string;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('--------------------------------------');
    writeln('-------------Login Page---------------');
    writeln('--------------------------------------');
    write('Username     : ');
    readln(name);
    write('Password     : ');
    readln(pw);
    if (a = 0) then
    begin
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        writeln('------------User not exist!-----------');
    end
    else
    begin
        j := 1;
        while (j < a) and (name <> adm_data[j].adm_name) and (pw <> adm_data[j].adm_pw) do
            j := j + 1;
        if (name = adm_data[j].adm_name) and (pw = adm_data[j].adm_pw) then
            adtask(i)
        else
        begin
            clrscr;
            writeln('Novita=======1301184101=======IF-42-09');
            writeln('======================================');
            writeln('        UNIVERSITY APPLICATION');
            writeln('======================================');
            writeln;
            writeln('------Wrong password or username!-----');
        end;
    end;
end;

procedure login_adm(var i: integer; var a: integer);
var
    adm_opt: integer;
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('1. Registration');
    writeln('2. Login');
    writeln('3. See admin list');
    writeln('4. Edit admin');
    writeln('5. Delete admin');
    write('Option: ');
    readln(adm_opt);
    if (adm_opt = 1) then
    begin
        adm_reg(adm_data, a);
    end
    else if (adm_opt = 2) then
        adm_log(i)
    else if (adm_opt = 3) then
        adm_list(adm_data, a)
    else if (adm_opt = 4) then
        listEdit(adm_data, a)
    else if (adm_opt = 5) then
        listDel(adm_data, a);
end; 

//---------------------------SUBMENU------------------------------

procedure sub_user(var i: integer);
begin
    repeat
        login_user(i);
        writeln;
        writeln('======================================');
        writeln('Do you want to continue as user? (Y/N)');
        write('Ans: ');
        readln(cont_user);
    until (cont_user = 'N') or (cont_user = 'n'); 
end;

procedure sub_admin(var i: integer);
begin
    repeat
        login_adm(i, a);
        writeln;
        writeln('======================================');
        writeln('Do you want to continue as admin? (Y/N)');
        write('Ans: ');
        readln(cont_adm);
        if (cont_adm = 'Y') or (cont_adm = 'y') then
            sub_admin(i);
    until (cont_adm = 'N') or (cont_adm = 'n');    
end;

//-----------------------------MAIN MENU--------------------------------

procedure main_menu(var i: integer);
begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('Login as: ');
    writeln('1. User');
    writeln('2. Admin');
    write('Option (1/2): ');
    readln(login);
    if (login = 1) then
        sub_user(i)
    else if (login = 2) then
        sub_admin(i);
end;

//---------------------------MAIN PROGRAM-------------------------------

begin
    clrscr;
    writeln('Novita=======1301184101=======IF-42-09');
    writeln('======================================');
    writeln('        UNIVERSITY APPLICATION');
    writeln('======================================');
    writeln;
    writeln('Login as: ');
    writeln('1. User');
    writeln('2. Admin');
    write('Option (1/2): ');
    readln(login);
    if (login = 1) then
    begin
        i := 0;
        login_user(i);
        writeln;
        writeln('======================================');
        writeln('Do you want to continue as user? (Y/N)');
        write('Ans: ');
        readln(cont_user);
        if (cont_user = 'Y') or (cont_user = 'y') then
            sub_user(i);
    end
    else if (login = 2) then
    begin
        a := 0;
        i := 0;
        login_adm(i, a);
        writeln;
        writeln('======================================');
        writeln('Do you want to continue as admin? (Y/N)');
        write('Ans: ');
        readln(cont_adm);
        if (cont_adm = 'Y') or (cont_adm = 'y') then
            sub_admin(i);
    end;
    repeat
        clrscr;
        writeln('Novita=======1301184101=======IF-42-09');
        writeln('======================================');
        writeln('        UNIVERSITY APPLICATION');
        writeln('======================================');
        writeln;
        writeln('Do you want to continue running the application? (Y/N)');
        write('Ans: ');
        readln(cont);
        if (cont = 'Y') or (cont = 'y') then
            main_menu(i);
        clrscr;
    until (cont = 'N') or  (cont = 'n');
end.
