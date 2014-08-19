#pragma once

#include <vector>

#include "../runtime/MemberNativeFunctionDefinition.hpp"
namespace geogen
{
	namespace corelib
	{
		/// <summary> Function definition for RandomSequence2D.GetNumber. </summary>
		class RandomSequence2DGetNumberFunctionDefinition : public runtime::MemberNativeFunctionDefinition
		{
		public:
			RandomSequence2DGetNumberFunctionDefinition(TypeDefinition const* type) : MemberNativeFunctionDefinition(GG_STR("GetNumber"), type) {};

			virtual runtime::ManagedObject* CallNative(CodeLocation location, runtime::VirtualMachine* vm, ManagedObject* instance, std::vector<runtime::ManagedObject*> arguments) const;

			virtual MethodType GetMethodType() const { return METHOD_TYPE_INSTANCE; }
		};
	}
}