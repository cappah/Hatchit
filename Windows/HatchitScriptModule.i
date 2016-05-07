%module HatchitScript

%{

#include <ht_math.h>
using namespace Hatchit;
using Vector3 = Hatchit::Math::Vector3;
%}

%include <windows.i>

namespace Hatchit {
	namespace Math {
		typedef struct{
			float x, y, z;
			static float Dot(Vector3& u, Vector3& v);

		} Vector3;
	}
}