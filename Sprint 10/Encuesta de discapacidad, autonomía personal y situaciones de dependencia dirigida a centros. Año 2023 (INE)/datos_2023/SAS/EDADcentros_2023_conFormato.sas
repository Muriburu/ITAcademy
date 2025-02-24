options fmtsearch = (ROutput ROutput.cat1);

* 2) DEFINICIÓN DE FORMATOS;
PROC FORMAT LIBRARY=ROutput.cat1;

*TABLAS1;
value $TCCAA

"01"="Andalucía"
"02"="Aragón"
"03"="Principado de Asturias"
"04"="Illes Balears"
"05"="Canarias"
"06"="Cantabria"
"07"="Castilla y León"
"08"="Castilla - La Mancha"
"09"="Cataluña"
"10"="Comunitat Valenciana"
"11"="Extremadura"
"12"="Galicia"
"13"="Comunidad de Madrid"
"14"="Región de Murcia"
"15"="Comunidad Foral de Navarra"
"16"="País Vasco"
"17"="La Rioja"
"18"="Ceuta"
"19"="Melilla"
;
value $TRELAC

"01"="Cónyuge o pareja"
"02"="Hijo/a"
"03"="Padre/Madre"
"04"="Hermano/a"
"05"="Otros familiares"
"06"="Personal del centro"
"07"="Servicios sociales"
"08"="Voluntarios"
"09"="Otros"
"99"="NC"
;
value $TPROXY

"1"="Discapacidad o enfermedad grave que le impide contestar"
"2"="Menor de 18 años"
"3"="Desconocimiento del idioma"
"4"="Ausencia prolongada"
;
value $T1CAUSA

"01"="Problema congénito"
"02"="Problemas de parto"
"03"="Accidente"
"04"="Enfermedad"
"05"="Proceso degenerativo derivado de la edad"
"06"="Otras causas"
"99"="NC"
;
value $T2CAUSA

"01"="Accidente laboral"
"02"="Accidente doméstico"
"03"="Accidente de ocio"
"04"="Otro tipo de accidente"
"99"="NC"
;
value $T3CAUSA

"01"="Enfermedad profesional"
"02"="Enfermedad común"
"99"="NC"
;
value $T4CAUSA

"01"="Accidente de tráfico"
"02"="Caída"
"03"="Otro tipo de accidente"
"99"="NC"
;
value $T5CAUSA

"01"="Cáncer o tumor"
"02"="Enfermedad cerebrovascular"
"03"="Enfermedad corazón"
"04"="Enfermedad reumática"
"05"="Enfermedad mental"
"06"="Enfermedad o proceso degenerativo derivado de la edad"
"07"="Otro tipo de enfermedad"
"99"="NC"
;
value $TSALUD

"1"="Muy bueno"
"2"="Bueno"
"3"="Regular"
"4"="Malo"
"5"="Muy malo"
"9"="NC"
;
value $TDISCRI

"1"="Nunca"
"2"="Algunas veces"
"3"="Muchas veces"
"4"="Constantemente"
"9"="NS/NC"
;
value $TRELACT

"01"="Trabajando"
"02"="En desempleo"
"03"="Jubilado/a, prejubilado/a, retirado/a de una actividad económica previa"
"04"="Estudiando"
"05"="Incapacitado para trabajar"
"06"="Realizando sin remuneracion trabajos sociales o actividades beneficas"
"07"="Otra situación"
"99"="NC"
;
value $TRESID

"1"="En la misma localidad"
"2"="En otra localidad"
"3"="No tiene"
"9"="NC"
;
value $TFREC

"1"="Todos o casi todos los días"
"2"="Una o dos veces por semana"
"3"="Una o dos veces al mes"
"4"="Menos de una vez al mes"
"8"="No procede, no utilizó teléfono, correo ni redes sociales"
"9"="NC"
;
value $TVAL

"1"="Excesivo"
"2"="Adecuado"
"3"="Insuficiente"
"4"="No tengo ningún contacto con mi familia, amigos o conocidos"
"9"="NC"
;
value $TCUID

"1"="Sí"
"2"="No recibo ningún servicio extra y no lo necesito"
"3"="No recibo ningún servicio extra pero lo necesito"
"9"="NC"
;
value $TGRATU

"1"="Es gratuito"
"2"="Le supone un desembolso económico"
"3"="Ambos"
"9"="NC"
;
value $TTPVIVI

"1"="Para personas mayores"
"2"="Para personas con discapacidad física, sensorial, intelectual o enfermedad mental u otro tipo"
;
value $TTPRESI

"1"="Centros residenciales para mayores"
"2"="Centros para personas con discapacidad"
;
value $TTITUL

"1"="Pública: Estatal"
"2"="Pública: Autonómica"
"3"="Pública: Diputación/Cabildo"
"4"="Pública: Municipal"
"5"="Privada: Con fin de lucro"
"6"="Privada: Sin fin de lucro"
;
value $TTAMCEN

"1"="Menos de 50 plazas"
"2"="Entre 50 y 74 plazas"
"3"="Entre 75 y 89 plazas"
"4"="Entre 90 y 119 plazas"
"5"="De 120 o más plazas"
;
value $TPCNTRO

"1"="Centros residenciales para mayores"
"2"="Centros para personas con discapacidad"
"3"="Viviendas tuteladas y/o supervisadas"
"4"="Hospitales psiquiátricos y geriátricos"
;
* Tablas 2;
value $TSEXO

"1"="Hombre"
"6"="Mujer"
;
value $T_SINO

"1"="Sí"
"6"="No"
"8"="No procede"
"9"="NC"
;
value $TSATIS

"1"="Sí"
"6"="No, es insuficiente"
"9"="NC"
;
value $TDECI

"1"="Sí"
"6"="No"
"8"="Suele depender del centro"
"9"="NC"
;
value $T1NIVEL

"1"="Con dificultad moderada"
"2"="Con gran dificultad"
"3"="No puede realizar la actividad"
"9"="NC"
;
value $T2NIVEL

"1"="Sin dificultad o con poca dificultad"
"2"="Con dificultad moderada"
"3"="Con gran dificultad"
"4"="No puede realizar la actividad por sí mismo"
"9"="NC"
;
value $TNACIO

"1"="Sólo española"
"2"="Sólo extranjera"
"3"="Española y extranjera"
"9"="NC"
;
value $TECIVIL

"1"="Soltero/a"
"2"="Casado/a"
"3"="Viudo/a"
"4"="Separado/a"
"5"="Divorciado/a"
"9"="NC"
;
value $TESTUD

"01"="No sabe leer ni escribir"
"02"="Estudios primarios incompletos"
"03"="Estudios primarios o equivalentes"
"04"="Educación secundaria de 1ª etapa"
"05"="Estudios de bachillerato"
"06"="Enseñanza profesional de grado medio"
"07"="Enseñanzas profesionales superiores"
"08"="Estudios universitarios o equivalentes"
"99"="NC"
;
value $TCERTIG

"1"="<25%"
"2"="25%-32%"
"3"="33%-44%"
"4"="45%-64%"
"5"="65%-74%"
"6"=">=75%"
"9"="NC"
;
value $TDEPENG

"1"="Grado I"
"2"="Grado II"
"3"="Grado III"
"9"="NC"
;
* Tablas 3;
value $TDEFICI

"11"="Retraso madurativo"
"12"="Deficiencia intelectual profunda y severa"
"13"="Deficiencia intelectual moderada"
"14"="Deficiencia intelectual leve"
"15"="Inteligencia límite"
"16"="Demencias"
"17"="Enfermedad mental"
"18"="Otros transtornos mentales"
"21"="Ceguera total"
"22"="Mala visión"
"31"="Sordera prelocutiva"
"32"="Sordera postlocutiva"
"33"="Mala audición"
"34"="Trastornos del equilibrio"
"41"="Mudez (no por sordera)"
"42"="Habla dificultosa o incomprensible"
"51"="Cabeza"
"52"="Columna vertebral"
"53"="Extremidades superiores"
"54"="Extremidades inferiores"
"61"="Parálisis de una extremidad superior"
"62"="Parálisis de una extremidad inferior"
"63"="Paraplejia"
"64"="Tetraplejia"
"65"="Trastornos de la coordinación de movimientos y/o tono muscular"
"66"="Otras deficiencias del sistema nervioso"
"71"="Aparato respiratorio"
"72"="Aparato cardiovascular"
"73"="Aparato digestivo"
"74"="Aparato genitourinario"
"75"="Sistema endocrino-metabólico"
"76"="Sistema hematopoyético y sistema inmunitario"
"81"="Piel"
"82"="Deficiencias múltiples"
"83"="Deficiencias no clasificadas en otra parte"
"99"="No consta"
;

;


* 3) VINCULAR FORMATOS A LA BASE DE DATOS;

	DATA ROutput.&siglas_periodo.&conFormato;
		set ROutput.&siglas_periodo;




FORMAT CCAA $TCCAA.;
FORMAT SEXO $TSEXO.;

FORMAT ECIVIL $TECIVIL.;
FORMAT NACIO $TNACIO.;
FORMAT ESTUDIO $TESTUD.;
FORMAT RELACT $TRELACT.;
FORMAT CERTIP $T_SINO.;
FORMAT CERTIG $TCERTIG.;
FORMAT DEPENP $T_SINO.;
FORMAT DEPENG $TDEPENG.;
FORMAT INFOR_DISC $T_SINO.;
FORMAT INFOR_SEXO $TSEXO.;

FORMAT INFOR_RELAC $TRELAC.;
FORMAT PROXY $TPROXY.;
FORMAT VISI_1_1 $T_SINO.;
FORMAT VISI_2_1 $T_SINO.;
FORMAT VISI_2_2 $T1NIVEL.;
FORMAT VISI_2_3 $T_SINO.;
FORMAT VISI_2_4 $T2NIVEL.;
FORMAT VISI_3_1 $T_SINO.;
FORMAT VISI_3_2 $T1NIVEL.;
FORMAT VISI_3_3 $T_SINO.;
FORMAT VISI_3_4 $T2NIVEL.;
FORMAT VISI_4_1 $T_SINO.;
FORMAT VISI_4_2 $T1NIVEL.;
FORMAT VISI_4_3 $T_SINO.;
FORMAT VISI_4_4 $T2NIVEL.;
FORMAT VISIC1_1 $T_SINO.;

FORMAT VISIC1_3 $T_SINO.;
FORMAT VISIC1_4 $T_SINO.;

FORMAT VISIC1_6_1 $TDEFICI.;
FORMAT VISIC1_6_2 $TDEFICI.;
FORMAT VISIC1_6_3 $TDEFICI.;
FORMAT VISIC1_6_4 $TDEFICI.;
FORMAT VISIC1_7 $TDEFICI.;
FORMAT VISIC1_8 $T1CAUSA.;
FORMAT VISIC1_8a $T2CAUSA.;
FORMAT VISIC1_8b $T3CAUSA.;
FORMAT VISIC1_8c $T4CAUSA.;
FORMAT VISIC1_8d $T5CAUSA.;

FORMAT VISIC1_10_1 $T_SINO.;
FORMAT VISIC1_10_2 $T_SINO.;
FORMAT VISIC1_10_3 $T_SINO.;
FORMAT VISIC1_10_4 $T_SINO.;
FORMAT VISIC1_10_5 $T_SINO.;
FORMAT VISIC1_10_6 $T_SINO.;
FORMAT AUDI_5_1 $T_SINO.;
FORMAT AUDI_6_1 $T_SINO.;
FORMAT AUDI_6_2 $T1NIVEL.;
FORMAT AUDI_6_3 $T_SINO.;
FORMAT AUDI_6_4 $T2NIVEL.;
FORMAT AUDI_7_1 $T_SINO.;
FORMAT AUDI_7_2 $T1NIVEL.;
FORMAT AUDI_7_3 $T_SINO.;
FORMAT AUDI_7_4 $T2NIVEL.;
FORMAT AUDIC2_1 $T_SINO.;

FORMAT AUDIC2_3 $T_SINO.;

FORMAT AUDIC2_5 $T_SINO.;
FORMAT AUDIC2_6 $T_SINO.;

FORMAT AUDIC2_8_1 $TDEFICI.;
FORMAT AUDIC2_8_2 $TDEFICI.;
FORMAT AUDIC2_8_3 $TDEFICI.;
FORMAT AUDIC2_8_4 $TDEFICI.;
FORMAT AUDIC2_9 $TDEFICI.;
FORMAT AUDIC2_10 $T1CAUSA.;
FORMAT AUDIC2_10a $T2CAUSA.;
FORMAT AUDIC2_10b $T3CAUSA.;
FORMAT AUDIC2_10c $T4CAUSA.;
FORMAT AUDIC2_10d $T5CAUSA.;

FORMAT COMU_8_1 $T_SINO.;
FORMAT COMU_8_2 $T1NIVEL.;
FORMAT COMU_8_3 $T_SINO.;
FORMAT COMU_8_4 $T2NIVEL.;
FORMAT COMU_9_1 $T_SINO.;
FORMAT COMU_9_2 $T1NIVEL.;
FORMAT COMU_9_3 $T_SINO.;
FORMAT COMU_9_4 $T2NIVEL.;
FORMAT COMU_10_1 $T_SINO.;
FORMAT COMU_10_2 $T1NIVEL.;
FORMAT COMU_11_1 $T_SINO.;
FORMAT COMU_11_2 $T1NIVEL.;
FORMAT COMU_12_1 $T_SINO.;
FORMAT COMU_12_2 $T1NIVEL.;
FORMAT COMU_13_1 $T_SINO.;
FORMAT COMU_13_2 $T1NIVEL.;
FORMAT COMU_13_3 $T_SINO.;
FORMAT COMU_13_4 $T2NIVEL.;
FORMAT COMU_14_1 $T_SINO.;
FORMAT COMU_14_2 $T1NIVEL.;
FORMAT COMU_14_3 $T_SINO.;
FORMAT COMU_14_4 $T2NIVEL.;
FORMAT COMUC3_1 $T_SINO.;
FORMAT COMUC3_2 $T_SINO.;

FORMAT COMUC3_4_1 $TDEFICI.;
FORMAT COMUC3_4_2 $TDEFICI.;
FORMAT COMUC3_4_3 $TDEFICI.;
FORMAT COMUC3_4_4 $TDEFICI.;
FORMAT COMUC3_5 $TDEFICI.;
FORMAT COMUC3_6 $T1CAUSA.;
FORMAT COMUC3_6a $T2CAUSA.;
FORMAT COMUC3_6b $T3CAUSA.;
FORMAT COMUC3_6c $T4CAUSA.;
FORMAT COMUC3_6d $T5CAUSA.;

FORMAT APRE_15_1 $T_SINO.;
FORMAT APRE_15_2 $T1NIVEL.;
FORMAT APRE_16_1 $T_SINO.;
FORMAT APRE_16_2 $T1NIVEL.;
FORMAT APRE_16_3 $T_SINO.;
FORMAT APRE_16_4 $T2NIVEL.;
FORMAT APRE_17_1 $T_SINO.;
FORMAT APRE_17_2 $T1NIVEL.;
FORMAT APRE_17_3 $T_SINO.;
FORMAT APRE_17_4 $T2NIVEL.;
FORMAT APRE_18_1 $T_SINO.;
FORMAT APRE_18_2 $T1NIVEL.;
FORMAT APRE_18_3 $T_SINO.;
FORMAT APRE_18_4 $T2NIVEL.;
FORMAT APREC4_1 $T_SINO.;
FORMAT APREC4_2 $T_SINO.;

FORMAT APREC4_4_1 $TDEFICI.;
FORMAT APREC4_4_2 $TDEFICI.;
FORMAT APREC4_4_3 $TDEFICI.;
FORMAT APREC4_4_4 $TDEFICI.;
FORMAT APREC4_5 $TDEFICI.;
FORMAT APREC4_6 $T1CAUSA.;
FORMAT APREC4_6a $T2CAUSA.;
FORMAT APREC4_6b $T3CAUSA.;
FORMAT APREC4_6c $T4CAUSA.;
FORMAT APREC4_6d $T5CAUSA.;

FORMAT MOVI_19_1 $T_SINO.;
FORMAT MOVI_19_2 $T1NIVEL.;
FORMAT MOVI_19_3 $T_SINO.;
FORMAT MOVI_19_4 $T2NIVEL.;
FORMAT MOVI_20_1 $T_SINO.;
FORMAT MOVI_20_2 $T1NIVEL.;
FORMAT MOVI_20_3 $T_SINO.;
FORMAT MOVI_20_4 $T2NIVEL.;
FORMAT MOVI_21_1 $T_SINO.;
FORMAT MOVI_21_2 $T1NIVEL.;
FORMAT MOVI_21_3 $T_SINO.;
FORMAT MOVI_21_4 $T2NIVEL.;
FORMAT MOVI_22_1 $T_SINO.;
FORMAT MOVI_22_2 $T1NIVEL.;
FORMAT MOVI_22_3 $T_SINO.;
FORMAT MOVI_22_4 $T2NIVEL.;
FORMAT MOVI_23_1 $T_SINO.;
FORMAT MOVI_23_2 $T1NIVEL.;
FORMAT MOVI_23_3 $T_SINO.;
FORMAT MOVI_23_4 $T2NIVEL.;
FORMAT MOVI_24_1 $T_SINO.;
FORMAT MOVI_24_2 $T1NIVEL.;
FORMAT MOVI_24_3 $T_SINO.;
FORMAT MOVI_24_4 $T2NIVEL.;
FORMAT MOVI_25_1 $T_SINO.;
FORMAT MOVI_25_2 $T1NIVEL.;
FORMAT MOVI_25_3 $T_SINO.;
FORMAT MOVI_25_4 $T2NIVEL.;
FORMAT MOVI_26_1 $T_SINO.;
FORMAT MOVI_26_2 $T1NIVEL.;
FORMAT MOVI_26_3 $T_SINO.;
FORMAT MOVI_26_4 $T2NIVEL.;
FORMAT MOVIC5_1 $T_SINO.;
FORMAT MOVIC5_2 $T_SINO.;

FORMAT MOVIC5_4_1 $TDEFICI.;
FORMAT MOVIC5_4_2 $TDEFICI.;
FORMAT MOVIC5_4_3 $TDEFICI.;
FORMAT MOVIC5_4_4 $TDEFICI.;
FORMAT MOVIC5_5 $TDEFICI.;
FORMAT MOVIC5_6 $T1CAUSA.;
FORMAT MOVIC5_6a $T2CAUSA.;
FORMAT MOVIC5_6b $T3CAUSA.;
FORMAT MOVIC5_6c $T4CAUSA.;
FORMAT MOVIC5_6d $T5CAUSA.;

FORMAT AUTO_27_1 $T_SINO.;
FORMAT AUTO_27_2 $T1NIVEL.;
FORMAT AUTO_27_3 $T_SINO.;
FORMAT AUTO_27_4 $T2NIVEL.;
FORMAT AUTO_28_1 $T_SINO.;
FORMAT AUTO_28_2 $T1NIVEL.;
FORMAT AUTO_28_3 $T_SINO.;
FORMAT AUTO_28_4 $T2NIVEL.;
FORMAT AUTO_29_1 $T_SINO.;
FORMAT AUTO_29_2 $T1NIVEL.;
FORMAT AUTO_29_3 $T_SINO.;
FORMAT AUTO_29_4 $T2NIVEL.;
FORMAT AUTO_30_1 $T_SINO.;
FORMAT AUTO_30_2 $T1NIVEL.;
FORMAT AUTO_30_3 $T_SINO.;
FORMAT AUTO_30_4 $T2NIVEL.;
FORMAT AUTO_31_1 $T_SINO.;
FORMAT AUTO_31_2 $T1NIVEL.;
FORMAT AUTO_31_3 $T_SINO.;
FORMAT AUTO_31_4 $T2NIVEL.;
FORMAT AUTO_32_1 $T_SINO.;
FORMAT AUTO_32_2 $T1NIVEL.;
FORMAT AUTO_32_3 $T_SINO.;
FORMAT AUTO_32_4 $T2NIVEL.;
FORMAT AUTO_33_1 $T_SINO.;
FORMAT AUTO_33_2 $T1NIVEL.;
FORMAT AUTO_33_3 $T_SINO.;
FORMAT AUTO_33_4 $T2NIVEL.;
FORMAT AUTOC6_1 $T_SINO.;
FORMAT AUTOC6_2 $T_SINO.;

FORMAT AUTOC6_4_1 $TDEFICI.;
FORMAT AUTOC6_4_2 $TDEFICI.;
FORMAT AUTOC6_4_3 $TDEFICI.;
FORMAT AUTOC6_4_4 $TDEFICI.;
FORMAT AUTOC6_5 $TDEFICI.;
FORMAT AUTOC6_6 $T1CAUSA.;
FORMAT AUTOC6_6a $T2CAUSA.;
FORMAT AUTOC6_6b $T3CAUSA.;
FORMAT AUTOC6_6c $T4CAUSA.;
FORMAT AUTOC6_6d $T5CAUSA.;

FORMAT VDOM_34_1 $T_SINO.;
FORMAT VDOM_34_2 $T1NIVEL.;
FORMAT VDOM_34_3 $T_SINO.;
FORMAT VDOM_34_4 $T2NIVEL.;
FORMAT VDOM_35_1 $T_SINO.;
FORMAT VDOM_35_2 $T1NIVEL.;
FORMAT VDOM_36_1 $T_SINO.;
FORMAT VDOM_36_2 $T1NIVEL.;

FORMAT VDOMC7_4_1 $TDEFICI.;
FORMAT VDOMC7_4_2 $TDEFICI.;
FORMAT VDOMC7_4_3 $TDEFICI.;
FORMAT VDOMC7_4_4 $TDEFICI.;
FORMAT VDOMC7_5 $TDEFICI.;
FORMAT VDOMC7_6 $T1CAUSA.;
FORMAT VDOMC7_6a $T2CAUSA.;
FORMAT VDOMC7_6b $T3CAUSA.;
FORMAT VDOMC7_6c $T4CAUSA.;
FORMAT VDOMC7_6d $T5CAUSA.;

FORMAT RELA_37_1 $T_SINO.;
FORMAT RELA_37_2 $T1NIVEL.;
FORMAT RELA_38_1 $T_SINO.;
FORMAT RELA_38_2 $T1NIVEL.;
FORMAT RELA_39_1 $T_SINO.;
FORMAT RELA_39_2 $T1NIVEL.;
FORMAT RELA_40_1 $T_SINO.;
FORMAT RELA_40_2 $T1NIVEL.;
FORMAT RELA_41_1 $T_SINO.;
FORMAT RELA_41_2 $T1NIVEL.;

FORMAT RELAC8_2_1 $TDEFICI.;
FORMAT RELAC8_2_2 $TDEFICI.;
FORMAT RELAC8_2_3 $TDEFICI.;
FORMAT RELAC8_2_4 $TDEFICI.;
FORMAT RELAC8_3 $TDEFICI.;
FORMAT RELAC8_4 $T1CAUSA.;
FORMAT RELAC8_4a $T2CAUSA.;
FORMAT RELAC8_4b $T3CAUSA.;
FORMAT RELAC8_4c $T4CAUSA.;
FORMAT RELAC8_4d $T5CAUSA.;

FORMAT D_1 $TSALUD.;
FORMAT D_2_1 $T_SINO.;
FORMAT D_2_2 $T_SINO.;
FORMAT D_2_3 $T_SINO.;
FORMAT D_2_4 $T_SINO.;
FORMAT D_2_5 $T_SINO.;
FORMAT D_2_6 $T_SINO.;
FORMAT D_2_7 $T_SINO.;
FORMAT D_2_8 $T_SINO.;
FORMAT D_2_9 $T_SINO.;
FORMAT D_2_10 $T_SINO.;
FORMAT D_2_11 $T_SINO.;
FORMAT D_2_12 $T_SINO.;
FORMAT D_2_13 $T_SINO.;
FORMAT D_2_14 $T_SINO.;
FORMAT D_2_15 $T_SINO.;
FORMAT D_2_16 $T_SINO.;
FORMAT D_2_17 $T_SINO.;
FORMAT D_2_18 $T_SINO.;
FORMAT D_2_19 $T_SINO.;
FORMAT D_2_20 $T_SINO.;
FORMAT D_2_21 $T_SINO.;
FORMAT D_2_22 $T_SINO.;
FORMAT D_2_23 $T_SINO.;
FORMAT D_2_24 $T_SINO.;
FORMAT D_2_25 $T_SINO.;
FORMAT D_2_26 $T_SINO.;
FORMAT D_2_27 $T_SINO.;
FORMAT D_2_28 $T_SINO.;
FORMAT D_2_29 $T_SINO.;
FORMAT D_3 $T_SINO.;
FORMAT E_1 $TDISCRI.;
FORMAT E_2_1 $T_SINO.;
FORMAT E_2_2 $T_SINO.;
FORMAT E_2_3 $T_SINO.;
FORMAT E_2_4 $T_SINO.;
FORMAT E_2_5 $T_SINO.;
FORMAT E_2_6 $T_SINO.;
FORMAT F_1_1 $TRESID.;
FORMAT F_1_2 $TRESID.;
FORMAT F_2 $TFREC.;
FORMAT F_3 $TFREC.;
FORMAT F_4 $TVAL.;
FORMAT F_5_1 $T_SINO.;
FORMAT F_5_2 $T_SINO.;
FORMAT F_5_3 $T_SINO.;
FORMAT F_5_4 $T_SINO.;
FORMAT F_5_5 $T_SINO.;
FORMAT F_5_6 $T_SINO.;
FORMAT F_5_7 $T_SINO.;
FORMAT F_5_8 $T_SINO.;
FORMAT F_5_9 $T_SINO.;
FORMAT F_5_10 $T_SINO.;
FORMAT F_5_11 $T_SINO.;
FORMAT F_5_12 $T_SINO.;
FORMAT F_5_13 $T_SINO.;
FORMAT F_5_14 $T_SINO.;
FORMAT F_5_15 $T_SINO.;
FORMAT G_1_1 $TDECI.;
FORMAT G_1_2 $TDECI.;
FORMAT G_1_3 $TDECI.;
FORMAT G_1_4 $TDECI.;
FORMAT G_1_5 $TDECI.;
FORMAT G_1_6 $TDECI.;
FORMAT G_1_7 $TDECI.;
FORMAT G_1_8 $TDECI.;
FORMAT G_1_9 $TDECI.;
FORMAT H_1_1 $T_SINO.;
FORMAT H_1_2 $T_SINO.;
FORMAT H_1_3 $T_SINO.;
FORMAT H_1_4 $T_SINO.;
FORMAT H_1_5 $T_SINO.;
FORMAT H_2 $T_SINO.;
FORMAT I_1 $TCUID.;
FORMAT I_2_1 $T_SINO.;
FORMAT I_2_2 $T_SINO.;
FORMAT I_2_3 $T_SINO.;
FORMAT I_2_4 $T_SINO.;
FORMAT I_2_5 $T_SINO.;
FORMAT I_3 $TGRATU.;
FORMAT I_4 $TSATIS.;

FORMAT TCENTRO $TPCNTRO.;
FORMAT TCENRES $TTPRESI.;
FORMAT TAMCEN $TTAMCEN.;
FORMAT TVIVT $TTPVIVI.;
FORMAT TITUL_CENTRO $TTITUL.;
FORMAT SERV_ACOMP $T_SINO.;
FORMAT SERV_FORMA $T_SINO.;
FORMAT SERV_REHAB $T_SINO.;
FORMAT SERV_SOCIOC $T_SINO.;
FORMAT SERV_AVD $T_SINO.;
FORMAT SERV_ENFER $T_SINO.;
FORMAT SERV_MEDGER $T_SINO.;
FORMAT SERV_PSICO $T_SINO.;
FORMAT SERV_SOCIAL $T_SINO.;
FORMAT SERV_TECNI $T_SINO.;
FORMAT SERV_PALIA $T_SINO.;
FORMAT SERV_CUIPERS $T_SINO.;
FORMAT SERV_DIETA $T_SINO.;
FORMAT SERV_EDUSALUD $T_SINO.;
FORMAT SERV_INFO $T_SINO.;
FORMAT SERV_INSER $T_SINO.;
FORMAT SERV_PREVEN $T_SINO.;
FORMAT SERV_AUTO $T_SINO.;
FORMAT SERV_ODONT $T_SINO.;
FORMAT SERV_TRANSP $T_SINO.;
FORMAT SERV_LIMPIA_V $T_SINO.;
FORMAT SERV_COMIDAS_V $T_SINO.;
FORMAT SERV_24H_V $T_SINO.;
FORMAT SERV_MANTEN_V $T_SINO.;
FORMAT SERV_MEDGER_V $T_SINO.;
FORMAT SERV_PSICO_V $T_SINO.;
FORMAT SERV_PELUPODO_V $T_SINO.;
FORMAT SERV_CULTOCIO_V $T_SINO.;
FORMAT SERV_REHAB_V $T_SINO.;
FORMAT SERV_AUTOAPREN_V $T_SINO.;
FORMAT SERV_INFO_V $T_SINO.;
FORMAT SERV_INSER_V $T_SINO.;
FORMAT SERV_OTROS_V $T_SINO.;
FORMAT PROT_ESTAND $T_SINO.;
FORMAT PROT_PERS $T_SINO.;
FORMAT PROT_CAIDAS $T_SINO.;
FORMAT PROT_PANALES $T_SINO.;
FORMAT PROT_DIETA $T_SINO.;
FORMAT PROT_SUJECION $T_SINO.;
FORMAT PROT_REGISTRO $T_SINO.;
RUN;
