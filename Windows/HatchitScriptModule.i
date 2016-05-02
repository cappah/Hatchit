%module HatchitScript

%{
using namespace Hatchit;
using Vector3 = Hatchit::Math::Vector3;
#include <ht_math.h>
%}

%include <windows.i>



typedef struct{
	float x, y, z;
	float Dot(Vector3* other)
	{
		return $self.Dot(other);
	}

} Vector3;
