
.text
.global suma_float

# Para los Floats se utilizan los registros xmm (son de 128bits)
# Segun System V:
# xmm0 funcion (xmm0, xmm1, xmm2, ...) Em Ensamblador
# float funcion (float1, float2, float3, ...) En C

suma_float:
	addss %xmm1, %xmm0	# xmm0 = xmm0 + xmm1
	ret
# addss: Add Scalar Single precision (Sumar un escalar de precision simple, es decir float)
