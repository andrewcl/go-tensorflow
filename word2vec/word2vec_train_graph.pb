
7
train_examplesPlaceholder*
shape: *
dtype0
5
train_labelsPlaceholder*
shape: *
dtype0
.
inputPlaceholder*
shape: *
dtype0
I
random_uniform/shapeConst*
dtype0*
valueB"PĆ     
?
random_uniform/minConst*
valueB
 *  æ*
dtype0
?
random_uniform/maxConst*
dtype0*
valueB
 *  ?
r
random_uniform/RandomUniformRandomUniformrandom_uniform/shape*
seed2 *
dtype0*
T0*

seed 
J
random_uniform/subSubrandom_uniform/maxrandom_uniform/min*
T0
T
random_uniform/mulMulrandom_uniform/RandomUniformrandom_uniform/sub*
T0
F
random_uniformAddrandom_uniform/mulrandom_uniform/min*
T0
`
	embedding
VariableV2*
	container *
shape:Š*
dtype0*
shared_name 

embedding/AssignAssign	embeddingrandom_uniform*
use_locking(*
validate_shape(*
T0*
_class
loc:@embedding
L
embedding/readIdentity	embedding*
_class
loc:@embedding*
T0

embedding_lookupGatherembedding/readtrain_examples*
_class
loc:@embedding*
validate_indices(*
Tparams0*
Tindices0
K
truncated_normal/shapeConst*
dtype0*
valueB"PĆ     
B
truncated_normal/meanConst*
dtype0*
valueB
 *    
D
truncated_normal/stddevConst*
dtype0*
valueB
 *óµ=
z
 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
seed2 *
T0*

seed *
dtype0
_
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
T0
M
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0
b
nce_weights
VariableV2*
	container *
shape:Š*
dtype0*
shared_name 

nce_weights/AssignAssignnce_weightstruncated_normal*
use_locking(*
T0*
_class
loc:@nce_weights*
validate_shape(
R
nce_weights/readIdentitynce_weights*
T0*
_class
loc:@nce_weights
8
zerosConst*
valueBŠ*    *
dtype0
\

nce_biases
VariableV2*
	container *
shape:Š*
dtype0*
shared_name 

nce_biases/AssignAssign
nce_biaseszeros*
use_locking(*
validate_shape(*
T0*
_class
loc:@nce_biases
O
nce_biases/readIdentity
nce_biases*
_class
loc:@nce_biases*
T0
;
nce_loss/CastCasttrain_labels*

DstT0	*

SrcT0
M
nce_loss/Reshape/shapeConst*
valueB:
’’’’’’’’’*
dtype0
Y
nce_loss/ReshapeReshapence_loss/Castnce_loss/Reshape/shape*
T0	*
Tshape0
­
#nce_loss/LogUniformCandidateSamplerLogUniformCandidateSamplernce_loss/Cast*
num_sampled@*
	range_maxŠ*
seed2 *
num_true*
unique(*

seed 
>
nce_loss/concat/axisConst*
value	B : *
dtype0

nce_loss/concatConcatV2nce_loss/Reshape#nce_loss/LogUniformCandidateSamplernce_loss/concat/axis*
T0	*

Tidx0*
N

nce_loss/embedding_lookupGathernce_weights/readnce_loss/concat*
_class
loc:@nce_weights*
validate_indices(*
Tparams0*
Tindices0	

nce_loss/embedding_lookup_1Gathernce_biases/readnce_loss/concat*
Tindices0	*
validate_indices(*
Tparams0*
_class
loc:@nce_biases
B
nce_loss/ShapeShapence_loss/Reshape*
T0	*
out_type0
J
nce_loss/strided_slice/stackConst*
valueB: *
dtype0
L
nce_loss/strided_slice/stack_1Const*
valueB:*
dtype0
L
nce_loss/strided_slice/stack_2Const*
valueB:*
dtype0

nce_loss/strided_sliceStridedSlicence_loss/Shapence_loss/strided_slice/stacknce_loss/strided_slice/stack_1nce_loss/strided_slice/stack_2*
T0*
Index0*
new_axis_mask *
shrink_axis_mask*

begin_mask *
ellipsis_mask *
end_mask 
C
nce_loss/stack/1Const*
valueB :
’’’’’’’’’*
dtype0
^
nce_loss/stackPacknce_loss/strided_slicence_loss/stack/1*

axis *
T0*
N
I
nce_loss/Slice/beginConst*
valueB"        *
dtype0
n
nce_loss/SliceSlicence_loss/embedding_lookupnce_loss/Slice/beginnce_loss/stack*
T0*
Index0
D
nce_loss/Shape_1Shapence_loss/Reshape*
out_type0*
T0	
D
nce_loss/Slice_1/beginConst*
dtype0*
valueB: 
v
nce_loss/Slice_1Slicence_loss/embedding_lookup_1nce_loss/Slice_1/beginnce_loss/Shape_1*
T0*
Index0
B
nce_loss/Shape_2Shapence_loss/Slice*
out_type0*
T0
L
nce_loss/strided_slice_1/stackConst*
valueB:*
dtype0
N
 nce_loss/strided_slice_1/stack_1Const*
dtype0*
valueB:
N
 nce_loss/strided_slice_1/stack_2Const*
dtype0*
valueB:

nce_loss/strided_slice_1StridedSlicence_loss/Shape_2nce_loss/strided_slice_1/stack nce_loss/strided_slice_1/stack_1 nce_loss/strided_slice_1/stack_2*

begin_mask *
ellipsis_mask *
end_mask *
T0*
Index0*
shrink_axis_mask *
new_axis_mask 
O
nce_loss/concat_1/values_0Const*
dtype0*
valueB"’’’’   
@
nce_loss/concat_1/axisConst*
value	B : *
dtype0

nce_loss/concat_1ConcatV2nce_loss/concat_1/values_0nce_loss/strided_slice_1nce_loss/concat_1/axis*
T0*

Tidx0*
N
A
nce_loss/ExpandDims/dimConst*
value	B :*
dtype0
a
nce_loss/ExpandDims
ExpandDimsembedding_lookupnce_loss/ExpandDims/dim*
T0*

Tdim0
W
nce_loss/Reshape_1Reshapence_loss/Slicence_loss/concat_1*
T0*
Tshape0
E
nce_loss/MulMulnce_loss/ExpandDimsnce_loss/Reshape_1*
T0
Q
nce_loss/concat_2/values_0Const*
valueB:
’’’’’’’’’*
dtype0
@
nce_loss/concat_2/axisConst*
dtype0*
value	B : 

nce_loss/concat_2ConcatV2nce_loss/concat_2/values_0nce_loss/strided_slice_1nce_loss/concat_2/axis*

Tidx0*
T0*
N
U
nce_loss/Reshape_2Reshapence_loss/Mulnce_loss/concat_2*
T0*
Tshape0
F
nce_loss/Shape_3Shapence_loss/Reshape_2*
out_type0*
T0
L
nce_loss/strided_slice_2/stackConst*
valueB:*
dtype0
N
 nce_loss/strided_slice_2/stack_1Const*
valueB:*
dtype0
N
 nce_loss/strided_slice_2/stack_2Const*
dtype0*
valueB:

nce_loss/strided_slice_2StridedSlicence_loss/Shape_3nce_loss/strided_slice_2/stack nce_loss/strided_slice_2/stack_1 nce_loss/strided_slice_2/stack_2*
end_mask *
new_axis_mask *

begin_mask *
ellipsis_mask *
shrink_axis_mask*
T0*
Index0
<
nce_loss/stack_1/1Const*
value	B :*
dtype0
d
nce_loss/stack_1Packnce_loss/strided_slice_2nce_loss/stack_1/1*

axis *
T0*
N
@
nce_loss/ones/ConstConst*
valueB
 *  ?*
dtype0
E
nce_loss/onesFillnce_loss/stack_1nce_loss/ones/Const*
T0
k
nce_loss/MatMulMatMulnce_loss/Reshape_2nce_loss/ones*
transpose_b( *
transpose_a( *
T0
O
nce_loss/Reshape_3/shapeConst*
valueB:
’’’’’’’’’*
dtype0
_
nce_loss/Reshape_3Reshapence_loss/MatMulnce_loss/Reshape_3/shape*
Tshape0*
T0
M
nce_loss/Reshape_4/shapeConst*
valueB"’’’’   *
dtype0
b
nce_loss/Reshape_4Reshapence_loss/Reshape_3nce_loss/Reshape_4/shape*
T0*
Tshape0
M
nce_loss/Reshape_5/shapeConst*
valueB"’’’’   *
dtype0
`
nce_loss/Reshape_5Reshapence_loss/Slice_1nce_loss/Reshape_5/shape*
T0*
Tshape0
D
nce_loss/addAddnce_loss/Reshape_4nce_loss/Reshape_5*
T0
D
nce_loss/Shape_4Shapence_loss/Reshape*
out_type0*
T0	
L
nce_loss/strided_slice_3/stackConst*
valueB: *
dtype0
N
 nce_loss/strided_slice_3/stack_1Const*
valueB:*
dtype0
N
 nce_loss/strided_slice_3/stack_2Const*
valueB:*
dtype0

nce_loss/strided_slice_3StridedSlicence_loss/Shape_4nce_loss/strided_slice_3/stack nce_loss/strided_slice_3/stack_1 nce_loss/strided_slice_3/stack_2*

begin_mask *
ellipsis_mask *
end_mask *
T0*
Index0*
shrink_axis_mask*
new_axis_mask 
<
nce_loss/stack_2/1Const*
value	B : *
dtype0
d
nce_loss/stack_2Packnce_loss/strided_slice_3nce_loss/stack_2/1*
N*

axis *
T0
J
nce_loss/Slice_2/sizeConst*
dtype0*
valueB"’’’’’’’’
s
nce_loss/Slice_2Slicence_loss/embedding_lookupnce_loss/stack_2nce_loss/Slice_2/size*
T0*
Index0
D
nce_loss/Shape_5Shapence_loss/Reshape*
T0	*
out_type0
L
nce_loss/Slice_3/sizeConst*
valueB:
’’’’’’’’’*
dtype0
u
nce_loss/Slice_3Slicence_loss/embedding_lookup_1nce_loss/Shape_5nce_loss/Slice_3/size*
T0*
Index0
n
nce_loss/MatMul_1MatMulembedding_lookupnce_loss/Slice_2*
transpose_b(*
T0*
transpose_a( 
C
nce_loss/add_1Addnce_loss/MatMul_1nce_loss/Slice_3*
T0
C
nce_loss/LogLog%nce_loss/LogUniformCandidateSampler:1*
T0
8
nce_loss/subSubnce_loss/addnce_loss/Log*
T0
E
nce_loss/Log_1Log%nce_loss/LogUniformCandidateSampler:2*
T0
>
nce_loss/sub_1Subnce_loss/add_1nce_loss/Log_1*
T0
@
nce_loss/concat_3/axisConst*
dtype0*
value	B :
q
nce_loss/concat_3ConcatV2nce_loss/subnce_loss/sub_1nce_loss/concat_3/axis*
N*
T0*

Tidx0
H
nce_loss/ones_like/ShapeShapence_loss/sub*
T0*
out_type0
E
nce_loss/ones_like/ConstConst*
dtype0*
valueB
 *  ?
W
nce_loss/ones_likeFillnce_loss/ones_like/Shapence_loss/ones_like/Const*
T0
?
nce_loss/truediv/yConst*
valueB
 *  ?*
dtype0
L
nce_loss/truedivRealDivnce_loss/ones_likence_loss/truediv/y*
T0
9
nce_loss/zeros_like	ZerosLikence_loss/sub_1*
T0
@
nce_loss/concat_4/axisConst*
value	B :*
dtype0
z
nce_loss/concat_4ConcatV2nce_loss/truedivnce_loss/zeros_likence_loss/concat_4/axis*

Tidx0*
T0*
N
B
sampled_losses/zeros_like	ZerosLikence_loss/concat_3*
T0
b
sampled_losses/GreaterEqualGreaterEqualnce_loss/concat_3sampled_losses/zeros_like*
T0
s
sampled_losses/SelectSelectsampled_losses/GreaterEqualnce_loss/concat_3sampled_losses/zeros_like*
T0
5
sampled_losses/NegNegnce_loss/concat_3*
T0
n
sampled_losses/Select_1Selectsampled_losses/GreaterEqualsampled_losses/Negnce_loss/concat_3*
T0
H
sampled_losses/mulMulnce_loss/concat_3nce_loss/concat_4*
T0
M
sampled_losses/subSubsampled_losses/Selectsampled_losses/mul*
T0
;
sampled_losses/ExpExpsampled_losses/Select_1*
T0
:
sampled_losses/Log1pLog1psampled_losses/Exp*
T0
H
sampled_lossesAddsampled_losses/subsampled_losses/Log1p*
T0
7
ShapeShapesampled_losses*
T0*
out_type0
A
strided_slice/stackConst*
valueB:*
dtype0
C
strided_slice/stack_1Const*
dtype0*
valueB:
C
strided_slice/stack_2Const*
dtype0*
valueB:
į
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
T0*
Index0*
shrink_axis_mask
1
stack/1Const*
dtype0*
value	B :
C
stackPackstrided_slicestack/1*
N*
T0*

axis 
7

ones/ConstConst*
dtype0*
valueB
 *  ?
(
onesFillstack
ones/Const*
T0
U
MatMulMatMulsampled_lossesones*
transpose_b( *
transpose_a( *
T0
D
Reshape/shapeConst*
valueB:
’’’’’’’’’*
dtype0
@
ReshapeReshapeMatMulReshape/shape*
T0*
Tshape0
3
ConstConst*
valueB: *
dtype0
B
lossMeanReshapeConst*
T0*

Tidx0*
	keep_dims( 
8
gradients/ShapeConst*
dtype0*
valueB 
<
gradients/ConstConst*
valueB
 *  ?*
dtype0
A
gradients/FillFillgradients/Shapegradients/Const*
T0
O
!gradients/loss_grad/Reshape/shapeConst*
dtype0*
valueB:
p
gradients/loss_grad/ReshapeReshapegradients/Fill!gradients/loss_grad/Reshape/shape*
T0*
Tshape0
D
gradients/loss_grad/ShapeShapeReshape*
T0*
out_type0
s
gradients/loss_grad/TileTilegradients/loss_grad/Reshapegradients/loss_grad/Shape*
T0*

Tmultiples0
F
gradients/loss_grad/Shape_1ShapeReshape*
out_type0*
T0
D
gradients/loss_grad/Shape_2Const*
dtype0*
valueB 
G
gradients/loss_grad/ConstConst*
dtype0*
valueB: 
~
gradients/loss_grad/ProdProdgradients/loss_grad/Shape_1gradients/loss_grad/Const*
T0*

Tidx0*
	keep_dims( 
I
gradients/loss_grad/Const_1Const*
valueB: *
dtype0

gradients/loss_grad/Prod_1Prodgradients/loss_grad/Shape_2gradients/loss_grad/Const_1*
T0*

Tidx0*
	keep_dims( 
G
gradients/loss_grad/Maximum/yConst*
dtype0*
value	B :
j
gradients/loss_grad/MaximumMaximumgradients/loss_grad/Prod_1gradients/loss_grad/Maximum/y*
T0
h
gradients/loss_grad/floordivFloorDivgradients/loss_grad/Prodgradients/loss_grad/Maximum*
T0
V
gradients/loss_grad/CastCastgradients/loss_grad/floordiv*

DstT0*

SrcT0
c
gradients/loss_grad/truedivRealDivgradients/loss_grad/Tilegradients/loss_grad/Cast*
T0
F
gradients/Reshape_grad/ShapeShapeMatMul*
T0*
out_type0
{
gradients/Reshape_grad/ReshapeReshapegradients/loss_grad/truedivgradients/Reshape_grad/Shape*
Tshape0*
T0
{
gradients/MatMul_grad/MatMulMatMulgradients/Reshape_grad/Reshapeones*
transpose_b(*
transpose_a( *
T0

gradients/MatMul_grad/MatMul_1MatMulsampled_lossesgradients/Reshape_grad/Reshape*
transpose_b( *
transpose_a(*
T0
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
»
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul
Į
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
N
gradients/ones_grad/ConstConst*
dtype0*
valueB"       

gradients/ones_grad/SumSum0gradients/MatMul_grad/tuple/control_dependency_1gradients/ones_grad/Const*

Tidx0*
	keep_dims( *
T0
Y
#gradients/sampled_losses_grad/ShapeShapesampled_losses/sub*
T0*
out_type0
]
%gradients/sampled_losses_grad/Shape_1Shapesampled_losses/Log1p*
out_type0*
T0
”
3gradients/sampled_losses_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients/sampled_losses_grad/Shape%gradients/sampled_losses_grad/Shape_1*
T0
³
!gradients/sampled_losses_grad/SumSum.gradients/MatMul_grad/tuple/control_dependency3gradients/sampled_losses_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

%gradients/sampled_losses_grad/ReshapeReshape!gradients/sampled_losses_grad/Sum#gradients/sampled_losses_grad/Shape*
Tshape0*
T0
·
#gradients/sampled_losses_grad/Sum_1Sum.gradients/MatMul_grad/tuple/control_dependency5gradients/sampled_losses_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

'gradients/sampled_losses_grad/Reshape_1Reshape#gradients/sampled_losses_grad/Sum_1%gradients/sampled_losses_grad/Shape_1*
T0*
Tshape0

.gradients/sampled_losses_grad/tuple/group_depsNoOp&^gradients/sampled_losses_grad/Reshape(^gradients/sampled_losses_grad/Reshape_1
Ż
6gradients/sampled_losses_grad/tuple/control_dependencyIdentity%gradients/sampled_losses_grad/Reshape/^gradients/sampled_losses_grad/tuple/group_deps*8
_class.
,*loc:@gradients/sampled_losses_grad/Reshape*
T0
ć
8gradients/sampled_losses_grad/tuple/control_dependency_1Identity'gradients/sampled_losses_grad/Reshape_1/^gradients/sampled_losses_grad/tuple/group_deps*:
_class0
.,loc:@gradients/sampled_losses_grad/Reshape_1*
T0
`
'gradients/sampled_losses/sub_grad/ShapeShapesampled_losses/Select*
T0*
out_type0
_
)gradients/sampled_losses/sub_grad/Shape_1Shapesampled_losses/mul*
out_type0*
T0
­
7gradients/sampled_losses/sub_grad/BroadcastGradientArgsBroadcastGradientArgs'gradients/sampled_losses/sub_grad/Shape)gradients/sampled_losses/sub_grad/Shape_1*
T0
Ć
%gradients/sampled_losses/sub_grad/SumSum6gradients/sampled_losses_grad/tuple/control_dependency7gradients/sampled_losses/sub_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 

)gradients/sampled_losses/sub_grad/ReshapeReshape%gradients/sampled_losses/sub_grad/Sum'gradients/sampled_losses/sub_grad/Shape*
Tshape0*
T0
Ē
'gradients/sampled_losses/sub_grad/Sum_1Sum6gradients/sampled_losses_grad/tuple/control_dependency9gradients/sampled_losses/sub_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
^
%gradients/sampled_losses/sub_grad/NegNeg'gradients/sampled_losses/sub_grad/Sum_1*
T0

+gradients/sampled_losses/sub_grad/Reshape_1Reshape%gradients/sampled_losses/sub_grad/Neg)gradients/sampled_losses/sub_grad/Shape_1*
Tshape0*
T0

2gradients/sampled_losses/sub_grad/tuple/group_depsNoOp*^gradients/sampled_losses/sub_grad/Reshape,^gradients/sampled_losses/sub_grad/Reshape_1
ķ
:gradients/sampled_losses/sub_grad/tuple/control_dependencyIdentity)gradients/sampled_losses/sub_grad/Reshape3^gradients/sampled_losses/sub_grad/tuple/group_deps*<
_class2
0.loc:@gradients/sampled_losses/sub_grad/Reshape*
T0
ó
<gradients/sampled_losses/sub_grad/tuple/control_dependency_1Identity+gradients/sampled_losses/sub_grad/Reshape_13^gradients/sampled_losses/sub_grad/tuple/group_deps*>
_class4
20loc:@gradients/sampled_losses/sub_grad/Reshape_1*
T0

)gradients/sampled_losses/Log1p_grad/add/xConst9^gradients/sampled_losses_grad/tuple/control_dependency_1*
valueB
 *  ?*
dtype0
v
'gradients/sampled_losses/Log1p_grad/addAdd)gradients/sampled_losses/Log1p_grad/add/xsampled_losses/Exp*
T0
n
.gradients/sampled_losses/Log1p_grad/Reciprocal
Reciprocal'gradients/sampled_losses/Log1p_grad/add*
T0
”
'gradients/sampled_losses/Log1p_grad/mulMul8gradients/sampled_losses_grad/tuple/control_dependency_1.gradients/sampled_losses/Log1p_grad/Reciprocal*
T0
X
/gradients/sampled_losses/Select_grad/zeros_like	ZerosLikence_loss/concat_3*
T0
Č
+gradients/sampled_losses/Select_grad/SelectSelectsampled_losses/GreaterEqual:gradients/sampled_losses/sub_grad/tuple/control_dependency/gradients/sampled_losses/Select_grad/zeros_like*
T0
Ź
-gradients/sampled_losses/Select_grad/Select_1Selectsampled_losses/GreaterEqual/gradients/sampled_losses/Select_grad/zeros_like:gradients/sampled_losses/sub_grad/tuple/control_dependency*
T0

5gradients/sampled_losses/Select_grad/tuple/group_depsNoOp,^gradients/sampled_losses/Select_grad/Select.^gradients/sampled_losses/Select_grad/Select_1
÷
=gradients/sampled_losses/Select_grad/tuple/control_dependencyIdentity+gradients/sampled_losses/Select_grad/Select6^gradients/sampled_losses/Select_grad/tuple/group_deps*>
_class4
20loc:@gradients/sampled_losses/Select_grad/Select*
T0
ż
?gradients/sampled_losses/Select_grad/tuple/control_dependency_1Identity-gradients/sampled_losses/Select_grad/Select_16^gradients/sampled_losses/Select_grad/tuple/group_deps*
T0*@
_class6
42loc:@gradients/sampled_losses/Select_grad/Select_1
\
'gradients/sampled_losses/mul_grad/ShapeShapence_loss/concat_3*
out_type0*
T0
^
)gradients/sampled_losses/mul_grad/Shape_1Shapence_loss/concat_4*
out_type0*
T0
­
7gradients/sampled_losses/mul_grad/BroadcastGradientArgsBroadcastGradientArgs'gradients/sampled_losses/mul_grad/Shape)gradients/sampled_losses/mul_grad/Shape_1*
T0

%gradients/sampled_losses/mul_grad/mulMul<gradients/sampled_losses/sub_grad/tuple/control_dependency_1nce_loss/concat_4*
T0
²
%gradients/sampled_losses/mul_grad/SumSum%gradients/sampled_losses/mul_grad/mul7gradients/sampled_losses/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

)gradients/sampled_losses/mul_grad/ReshapeReshape%gradients/sampled_losses/mul_grad/Sum'gradients/sampled_losses/mul_grad/Shape*
Tshape0*
T0

'gradients/sampled_losses/mul_grad/mul_1Mulnce_loss/concat_3<gradients/sampled_losses/sub_grad/tuple/control_dependency_1*
T0
ø
'gradients/sampled_losses/mul_grad/Sum_1Sum'gradients/sampled_losses/mul_grad/mul_19gradients/sampled_losses/mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
”
+gradients/sampled_losses/mul_grad/Reshape_1Reshape'gradients/sampled_losses/mul_grad/Sum_1)gradients/sampled_losses/mul_grad/Shape_1*
T0*
Tshape0

2gradients/sampled_losses/mul_grad/tuple/group_depsNoOp*^gradients/sampled_losses/mul_grad/Reshape,^gradients/sampled_losses/mul_grad/Reshape_1
ķ
:gradients/sampled_losses/mul_grad/tuple/control_dependencyIdentity)gradients/sampled_losses/mul_grad/Reshape3^gradients/sampled_losses/mul_grad/tuple/group_deps*<
_class2
0.loc:@gradients/sampled_losses/mul_grad/Reshape*
T0
ó
<gradients/sampled_losses/mul_grad/tuple/control_dependency_1Identity+gradients/sampled_losses/mul_grad/Reshape_13^gradients/sampled_losses/mul_grad/tuple/group_deps*
T0*>
_class4
20loc:@gradients/sampled_losses/mul_grad/Reshape_1
r
%gradients/sampled_losses/Exp_grad/mulMul'gradients/sampled_losses/Log1p_grad/mulsampled_losses/Exp*
T0
O
%gradients/nce_loss/concat_4_grad/RankConst*
dtype0*
value	B :
x
$gradients/nce_loss/concat_4_grad/modFloorModnce_loss/concat_4/axis%gradients/nce_loss/concat_4_grad/Rank*
T0
Z
&gradients/nce_loss/concat_4_grad/ShapeShapence_loss/truediv*
out_type0*
T0
z
'gradients/nce_loss/concat_4_grad/ShapeNShapeNnce_loss/truedivnce_loss/zeros_like*
out_type0*
T0*
N
Ą
-gradients/nce_loss/concat_4_grad/ConcatOffsetConcatOffset$gradients/nce_loss/concat_4_grad/mod'gradients/nce_loss/concat_4_grad/ShapeN)gradients/nce_loss/concat_4_grad/ShapeN:1*
N
Ū
&gradients/nce_loss/concat_4_grad/SliceSlice<gradients/sampled_losses/mul_grad/tuple/control_dependency_1-gradients/nce_loss/concat_4_grad/ConcatOffset'gradients/nce_loss/concat_4_grad/ShapeN*
T0*
Index0
į
(gradients/nce_loss/concat_4_grad/Slice_1Slice<gradients/sampled_losses/mul_grad/tuple/control_dependency_1/gradients/nce_loss/concat_4_grad/ConcatOffset:1)gradients/nce_loss/concat_4_grad/ShapeN:1*
T0*
Index0

1gradients/nce_loss/concat_4_grad/tuple/group_depsNoOp'^gradients/nce_loss/concat_4_grad/Slice)^gradients/nce_loss/concat_4_grad/Slice_1
å
9gradients/nce_loss/concat_4_grad/tuple/control_dependencyIdentity&gradients/nce_loss/concat_4_grad/Slice2^gradients/nce_loss/concat_4_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/nce_loss/concat_4_grad/Slice
ė
;gradients/nce_loss/concat_4_grad/tuple/control_dependency_1Identity(gradients/nce_loss/concat_4_grad/Slice_12^gradients/nce_loss/concat_4_grad/tuple/group_deps*;
_class1
/-loc:@gradients/nce_loss/concat_4_grad/Slice_1*
T0
[
1gradients/sampled_losses/Select_1_grad/zeros_like	ZerosLikesampled_losses/Neg*
T0
·
-gradients/sampled_losses/Select_1_grad/SelectSelectsampled_losses/GreaterEqual%gradients/sampled_losses/Exp_grad/mul1gradients/sampled_losses/Select_1_grad/zeros_like*
T0
¹
/gradients/sampled_losses/Select_1_grad/Select_1Selectsampled_losses/GreaterEqual1gradients/sampled_losses/Select_1_grad/zeros_like%gradients/sampled_losses/Exp_grad/mul*
T0
”
7gradients/sampled_losses/Select_1_grad/tuple/group_depsNoOp.^gradients/sampled_losses/Select_1_grad/Select0^gradients/sampled_losses/Select_1_grad/Select_1
’
?gradients/sampled_losses/Select_1_grad/tuple/control_dependencyIdentity-gradients/sampled_losses/Select_1_grad/Select8^gradients/sampled_losses/Select_1_grad/tuple/group_deps*@
_class6
42loc:@gradients/sampled_losses/Select_1_grad/Select*
T0

Agradients/sampled_losses/Select_1_grad/tuple/control_dependency_1Identity/gradients/sampled_losses/Select_1_grad/Select_18^gradients/sampled_losses/Select_1_grad/tuple/group_deps*B
_class8
64loc:@gradients/sampled_losses/Select_1_grad/Select_1*
T0
[
%gradients/nce_loss/truediv_grad/ShapeShapence_loss/ones_like*
out_type0*
T0
P
'gradients/nce_loss/truediv_grad/Shape_1Const*
dtype0*
valueB 
§
5gradients/nce_loss/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients/nce_loss/truediv_grad/Shape'gradients/nce_loss/truediv_grad/Shape_1*
T0

'gradients/nce_loss/truediv_grad/RealDivRealDiv9gradients/nce_loss/concat_4_grad/tuple/control_dependencynce_loss/truediv/y*
T0
°
#gradients/nce_loss/truediv_grad/SumSum'gradients/nce_loss/truediv_grad/RealDiv5gradients/nce_loss/truediv_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

'gradients/nce_loss/truediv_grad/ReshapeReshape#gradients/nce_loss/truediv_grad/Sum%gradients/nce_loss/truediv_grad/Shape*
T0*
Tshape0
G
#gradients/nce_loss/truediv_grad/NegNegnce_loss/ones_like*
T0
v
)gradients/nce_loss/truediv_grad/RealDiv_1RealDiv#gradients/nce_loss/truediv_grad/Negnce_loss/truediv/y*
T0
|
)gradients/nce_loss/truediv_grad/RealDiv_2RealDiv)gradients/nce_loss/truediv_grad/RealDiv_1nce_loss/truediv/y*
T0

#gradients/nce_loss/truediv_grad/mulMul9gradients/nce_loss/concat_4_grad/tuple/control_dependency)gradients/nce_loss/truediv_grad/RealDiv_2*
T0
°
%gradients/nce_loss/truediv_grad/Sum_1Sum#gradients/nce_loss/truediv_grad/mul7gradients/nce_loss/truediv_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 

)gradients/nce_loss/truediv_grad/Reshape_1Reshape%gradients/nce_loss/truediv_grad/Sum_1'gradients/nce_loss/truediv_grad/Shape_1*
Tshape0*
T0

0gradients/nce_loss/truediv_grad/tuple/group_depsNoOp(^gradients/nce_loss/truediv_grad/Reshape*^gradients/nce_loss/truediv_grad/Reshape_1
å
8gradients/nce_loss/truediv_grad/tuple/control_dependencyIdentity'gradients/nce_loss/truediv_grad/Reshape1^gradients/nce_loss/truediv_grad/tuple/group_deps*:
_class0
.,loc:@gradients/nce_loss/truediv_grad/Reshape*
T0
ė
:gradients/nce_loss/truediv_grad/tuple/control_dependency_1Identity)gradients/nce_loss/truediv_grad/Reshape_11^gradients/nce_loss/truediv_grad/tuple/group_deps*<
_class2
0.loc:@gradients/nce_loss/truediv_grad/Reshape_1*
T0
v
%gradients/sampled_losses/Neg_grad/NegNeg?gradients/sampled_losses/Select_1_grad/tuple/control_dependency*
T0
\
'gradients/nce_loss/ones_like_grad/ConstConst*
dtype0*
valueB"       
µ
%gradients/nce_loss/ones_like_grad/SumSum8gradients/nce_loss/truediv_grad/tuple/control_dependency'gradients/nce_loss/ones_like_grad/Const*
T0*

Tidx0*
	keep_dims( 
Ķ
gradients/AddNAddN=gradients/sampled_losses/Select_grad/tuple/control_dependency:gradients/sampled_losses/mul_grad/tuple/control_dependencyAgradients/sampled_losses/Select_1_grad/tuple/control_dependency_1%gradients/sampled_losses/Neg_grad/Neg*>
_class4
20loc:@gradients/sampled_losses/Select_grad/Select*
T0*
N
O
%gradients/nce_loss/concat_3_grad/RankConst*
value	B :*
dtype0
x
$gradients/nce_loss/concat_3_grad/modFloorModnce_loss/concat_3/axis%gradients/nce_loss/concat_3_grad/Rank*
T0
V
&gradients/nce_loss/concat_3_grad/ShapeShapence_loss/sub*
out_type0*
T0
q
'gradients/nce_loss/concat_3_grad/ShapeNShapeNnce_loss/subnce_loss/sub_1*
out_type0*
T0*
N
Ą
-gradients/nce_loss/concat_3_grad/ConcatOffsetConcatOffset$gradients/nce_loss/concat_3_grad/mod'gradients/nce_loss/concat_3_grad/ShapeN)gradients/nce_loss/concat_3_grad/ShapeN:1*
N
­
&gradients/nce_loss/concat_3_grad/SliceSlicegradients/AddN-gradients/nce_loss/concat_3_grad/ConcatOffset'gradients/nce_loss/concat_3_grad/ShapeN*
T0*
Index0
³
(gradients/nce_loss/concat_3_grad/Slice_1Slicegradients/AddN/gradients/nce_loss/concat_3_grad/ConcatOffset:1)gradients/nce_loss/concat_3_grad/ShapeN:1*
T0*
Index0

1gradients/nce_loss/concat_3_grad/tuple/group_depsNoOp'^gradients/nce_loss/concat_3_grad/Slice)^gradients/nce_loss/concat_3_grad/Slice_1
å
9gradients/nce_loss/concat_3_grad/tuple/control_dependencyIdentity&gradients/nce_loss/concat_3_grad/Slice2^gradients/nce_loss/concat_3_grad/tuple/group_deps*9
_class/
-+loc:@gradients/nce_loss/concat_3_grad/Slice*
T0
ė
;gradients/nce_loss/concat_3_grad/tuple/control_dependency_1Identity(gradients/nce_loss/concat_3_grad/Slice_12^gradients/nce_loss/concat_3_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/nce_loss/concat_3_grad/Slice_1
Q
!gradients/nce_loss/sub_grad/ShapeShapence_loss/add*
T0*
out_type0
S
#gradients/nce_loss/sub_grad/Shape_1Shapence_loss/Log*
T0*
out_type0

1gradients/nce_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs!gradients/nce_loss/sub_grad/Shape#gradients/nce_loss/sub_grad/Shape_1*
T0
ŗ
gradients/nce_loss/sub_grad/SumSum9gradients/nce_loss/concat_3_grad/tuple/control_dependency1gradients/nce_loss/sub_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 

#gradients/nce_loss/sub_grad/ReshapeReshapegradients/nce_loss/sub_grad/Sum!gradients/nce_loss/sub_grad/Shape*
Tshape0*
T0
¾
!gradients/nce_loss/sub_grad/Sum_1Sum9gradients/nce_loss/concat_3_grad/tuple/control_dependency3gradients/nce_loss/sub_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
R
gradients/nce_loss/sub_grad/NegNeg!gradients/nce_loss/sub_grad/Sum_1*
T0

%gradients/nce_loss/sub_grad/Reshape_1Reshapegradients/nce_loss/sub_grad/Neg#gradients/nce_loss/sub_grad/Shape_1*
T0*
Tshape0

,gradients/nce_loss/sub_grad/tuple/group_depsNoOp$^gradients/nce_loss/sub_grad/Reshape&^gradients/nce_loss/sub_grad/Reshape_1
Õ
4gradients/nce_loss/sub_grad/tuple/control_dependencyIdentity#gradients/nce_loss/sub_grad/Reshape-^gradients/nce_loss/sub_grad/tuple/group_deps*6
_class,
*(loc:@gradients/nce_loss/sub_grad/Reshape*
T0
Ū
6gradients/nce_loss/sub_grad/tuple/control_dependency_1Identity%gradients/nce_loss/sub_grad/Reshape_1-^gradients/nce_loss/sub_grad/tuple/group_deps*8
_class.
,*loc:@gradients/nce_loss/sub_grad/Reshape_1*
T0
U
#gradients/nce_loss/sub_1_grad/ShapeShapence_loss/add_1*
out_type0*
T0
S
%gradients/nce_loss/sub_1_grad/Shape_1Const*
dtype0*
valueB:@
”
3gradients/nce_loss/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients/nce_loss/sub_1_grad/Shape%gradients/nce_loss/sub_1_grad/Shape_1*
T0
Ą
!gradients/nce_loss/sub_1_grad/SumSum;gradients/nce_loss/concat_3_grad/tuple/control_dependency_13gradients/nce_loss/sub_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0

%gradients/nce_loss/sub_1_grad/ReshapeReshape!gradients/nce_loss/sub_1_grad/Sum#gradients/nce_loss/sub_1_grad/Shape*
T0*
Tshape0
Ä
#gradients/nce_loss/sub_1_grad/Sum_1Sum;gradients/nce_loss/concat_3_grad/tuple/control_dependency_15gradients/nce_loss/sub_1_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 
V
!gradients/nce_loss/sub_1_grad/NegNeg#gradients/nce_loss/sub_1_grad/Sum_1*
T0

'gradients/nce_loss/sub_1_grad/Reshape_1Reshape!gradients/nce_loss/sub_1_grad/Neg%gradients/nce_loss/sub_1_grad/Shape_1*
T0*
Tshape0

.gradients/nce_loss/sub_1_grad/tuple/group_depsNoOp&^gradients/nce_loss/sub_1_grad/Reshape(^gradients/nce_loss/sub_1_grad/Reshape_1
Ż
6gradients/nce_loss/sub_1_grad/tuple/control_dependencyIdentity%gradients/nce_loss/sub_1_grad/Reshape/^gradients/nce_loss/sub_1_grad/tuple/group_deps*8
_class.
,*loc:@gradients/nce_loss/sub_1_grad/Reshape*
T0
ć
8gradients/nce_loss/sub_1_grad/tuple/control_dependency_1Identity'gradients/nce_loss/sub_1_grad/Reshape_1/^gradients/nce_loss/sub_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients/nce_loss/sub_1_grad/Reshape_1
W
!gradients/nce_loss/add_grad/ShapeShapence_loss/Reshape_4*
T0*
out_type0
Y
#gradients/nce_loss/add_grad/Shape_1Shapence_loss/Reshape_5*
out_type0*
T0

1gradients/nce_loss/add_grad/BroadcastGradientArgsBroadcastGradientArgs!gradients/nce_loss/add_grad/Shape#gradients/nce_loss/add_grad/Shape_1*
T0
µ
gradients/nce_loss/add_grad/SumSum4gradients/nce_loss/sub_grad/tuple/control_dependency1gradients/nce_loss/add_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 

#gradients/nce_loss/add_grad/ReshapeReshapegradients/nce_loss/add_grad/Sum!gradients/nce_loss/add_grad/Shape*
Tshape0*
T0
¹
!gradients/nce_loss/add_grad/Sum_1Sum4gradients/nce_loss/sub_grad/tuple/control_dependency3gradients/nce_loss/add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

%gradients/nce_loss/add_grad/Reshape_1Reshape!gradients/nce_loss/add_grad/Sum_1#gradients/nce_loss/add_grad/Shape_1*
Tshape0*
T0

,gradients/nce_loss/add_grad/tuple/group_depsNoOp$^gradients/nce_loss/add_grad/Reshape&^gradients/nce_loss/add_grad/Reshape_1
Õ
4gradients/nce_loss/add_grad/tuple/control_dependencyIdentity#gradients/nce_loss/add_grad/Reshape-^gradients/nce_loss/add_grad/tuple/group_deps*
T0*6
_class,
*(loc:@gradients/nce_loss/add_grad/Reshape
Ū
6gradients/nce_loss/add_grad/tuple/control_dependency_1Identity%gradients/nce_loss/add_grad/Reshape_1-^gradients/nce_loss/add_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients/nce_loss/add_grad/Reshape_1
X
#gradients/nce_loss/add_1_grad/ShapeShapence_loss/MatMul_1*
out_type0*
T0
Y
%gradients/nce_loss/add_1_grad/Shape_1Shapence_loss/Slice_3*
T0*
out_type0
”
3gradients/nce_loss/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients/nce_loss/add_1_grad/Shape%gradients/nce_loss/add_1_grad/Shape_1*
T0
»
!gradients/nce_loss/add_1_grad/SumSum6gradients/nce_loss/sub_1_grad/tuple/control_dependency3gradients/nce_loss/add_1_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 

%gradients/nce_loss/add_1_grad/ReshapeReshape!gradients/nce_loss/add_1_grad/Sum#gradients/nce_loss/add_1_grad/Shape*
T0*
Tshape0
æ
#gradients/nce_loss/add_1_grad/Sum_1Sum6gradients/nce_loss/sub_1_grad/tuple/control_dependency5gradients/nce_loss/add_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0

'gradients/nce_loss/add_1_grad/Reshape_1Reshape#gradients/nce_loss/add_1_grad/Sum_1%gradients/nce_loss/add_1_grad/Shape_1*
Tshape0*
T0

.gradients/nce_loss/add_1_grad/tuple/group_depsNoOp&^gradients/nce_loss/add_1_grad/Reshape(^gradients/nce_loss/add_1_grad/Reshape_1
Ż
6gradients/nce_loss/add_1_grad/tuple/control_dependencyIdentity%gradients/nce_loss/add_1_grad/Reshape/^gradients/nce_loss/add_1_grad/tuple/group_deps*8
_class.
,*loc:@gradients/nce_loss/add_1_grad/Reshape*
T0
ć
8gradients/nce_loss/add_1_grad/tuple/control_dependency_1Identity'gradients/nce_loss/add_1_grad/Reshape_1/^gradients/nce_loss/add_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients/nce_loss/add_1_grad/Reshape_1
]
'gradients/nce_loss/Reshape_4_grad/ShapeShapence_loss/Reshape_3*
out_type0*
T0
Ŗ
)gradients/nce_loss/Reshape_4_grad/ReshapeReshape4gradients/nce_loss/add_grad/tuple/control_dependency'gradients/nce_loss/Reshape_4_grad/Shape*
Tshape0*
T0
[
'gradients/nce_loss/Reshape_5_grad/ShapeShapence_loss/Slice_1*
T0*
out_type0
¬
)gradients/nce_loss/Reshape_5_grad/ReshapeReshape6gradients/nce_loss/add_grad/tuple/control_dependency_1'gradients/nce_loss/Reshape_5_grad/Shape*
T0*
Tshape0
Ŗ
'gradients/nce_loss/MatMul_1_grad/MatMulMatMul6gradients/nce_loss/add_1_grad/tuple/control_dependencynce_loss/Slice_2*
transpose_b( *
T0*
transpose_a( 
¬
)gradients/nce_loss/MatMul_1_grad/MatMul_1MatMul6gradients/nce_loss/add_1_grad/tuple/control_dependencyembedding_lookup*
transpose_b( *
transpose_a(*
T0

1gradients/nce_loss/MatMul_1_grad/tuple/group_depsNoOp(^gradients/nce_loss/MatMul_1_grad/MatMul*^gradients/nce_loss/MatMul_1_grad/MatMul_1
ē
9gradients/nce_loss/MatMul_1_grad/tuple/control_dependencyIdentity'gradients/nce_loss/MatMul_1_grad/MatMul2^gradients/nce_loss/MatMul_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients/nce_loss/MatMul_1_grad/MatMul
ķ
;gradients/nce_loss/MatMul_1_grad/tuple/control_dependency_1Identity)gradients/nce_loss/MatMul_1_grad/MatMul_12^gradients/nce_loss/MatMul_1_grad/tuple/group_deps*<
_class2
0.loc:@gradients/nce_loss/MatMul_1_grad/MatMul_1*
T0
N
$gradients/nce_loss/Slice_3_grad/RankConst*
value	B :*
dtype0
Y
%gradients/nce_loss/Slice_3_grad/ShapeShapence_loss/Slice_3*
T0*
out_type0
Q
'gradients/nce_loss/Slice_3_grad/stack/1Const*
value	B :*
dtype0

%gradients/nce_loss/Slice_3_grad/stackPack$gradients/nce_loss/Slice_3_grad/Rank'gradients/nce_loss/Slice_3_grad/stack/1*

axis *
T0*
N

'gradients/nce_loss/Slice_3_grad/ReshapeReshapence_loss/Shape_5%gradients/nce_loss/Slice_3_grad/stack*
T0*
Tshape0
f
'gradients/nce_loss/Slice_3_grad/Shape_1Shapence_loss/embedding_lookup_1*
T0*
out_type0

#gradients/nce_loss/Slice_3_grad/subSub'gradients/nce_loss/Slice_3_grad/Shape_1%gradients/nce_loss/Slice_3_grad/Shape*
T0
l
%gradients/nce_loss/Slice_3_grad/sub_1Sub#gradients/nce_loss/Slice_3_grad/subnce_loss/Shape_5*
T0

)gradients/nce_loss/Slice_3_grad/Reshape_1Reshape%gradients/nce_loss/Slice_3_grad/sub_1%gradients/nce_loss/Slice_3_grad/stack*
T0*
Tshape0
U
+gradients/nce_loss/Slice_3_grad/concat/axisConst*
value	B :*
dtype0
Ń
&gradients/nce_loss/Slice_3_grad/concatConcatV2'gradients/nce_loss/Slice_3_grad/Reshape)gradients/nce_loss/Slice_3_grad/Reshape_1+gradients/nce_loss/Slice_3_grad/concat/axis*
T0*

Tidx0*
N
¦
#gradients/nce_loss/Slice_3_grad/PadPad8gradients/nce_loss/add_1_grad/tuple/control_dependency_1&gradients/nce_loss/Slice_3_grad/concat*
T0*
	Tpaddings0
Z
'gradients/nce_loss/Reshape_3_grad/ShapeShapence_loss/MatMul*
out_type0*
T0

)gradients/nce_loss/Reshape_3_grad/ReshapeReshape)gradients/nce_loss/Reshape_4_grad/Reshape'gradients/nce_loss/Reshape_3_grad/Shape*
Tshape0*
T0
N
$gradients/nce_loss/Slice_1_grad/RankConst*
value	B :*
dtype0
Y
%gradients/nce_loss/Slice_1_grad/ShapeShapence_loss/Slice_1*
T0*
out_type0
Q
'gradients/nce_loss/Slice_1_grad/stack/1Const*
value	B :*
dtype0

%gradients/nce_loss/Slice_1_grad/stackPack$gradients/nce_loss/Slice_1_grad/Rank'gradients/nce_loss/Slice_1_grad/stack/1*
T0*

axis *
N

'gradients/nce_loss/Slice_1_grad/ReshapeReshapence_loss/Slice_1/begin%gradients/nce_loss/Slice_1_grad/stack*
T0*
Tshape0
f
'gradients/nce_loss/Slice_1_grad/Shape_1Shapence_loss/embedding_lookup_1*
T0*
out_type0

#gradients/nce_loss/Slice_1_grad/subSub'gradients/nce_loss/Slice_1_grad/Shape_1%gradients/nce_loss/Slice_1_grad/Shape*
T0
r
%gradients/nce_loss/Slice_1_grad/sub_1Sub#gradients/nce_loss/Slice_1_grad/subnce_loss/Slice_1/begin*
T0

)gradients/nce_loss/Slice_1_grad/Reshape_1Reshape%gradients/nce_loss/Slice_1_grad/sub_1%gradients/nce_loss/Slice_1_grad/stack*
Tshape0*
T0
U
+gradients/nce_loss/Slice_1_grad/concat/axisConst*
dtype0*
value	B :
Ń
&gradients/nce_loss/Slice_1_grad/concatConcatV2'gradients/nce_loss/Slice_1_grad/Reshape)gradients/nce_loss/Slice_1_grad/Reshape_1+gradients/nce_loss/Slice_1_grad/concat/axis*
N*
T0*

Tidx0

#gradients/nce_loss/Slice_1_grad/PadPad)gradients/nce_loss/Reshape_5_grad/Reshape&gradients/nce_loss/Slice_1_grad/concat*
	Tpaddings0*
T0
N
$gradients/nce_loss/Slice_2_grad/RankConst*
dtype0*
value	B :
Y
%gradients/nce_loss/Slice_2_grad/ShapeShapence_loss/Slice_2*
T0*
out_type0
Q
'gradients/nce_loss/Slice_2_grad/stack/1Const*
value	B :*
dtype0

%gradients/nce_loss/Slice_2_grad/stackPack$gradients/nce_loss/Slice_2_grad/Rank'gradients/nce_loss/Slice_2_grad/stack/1*
T0*

axis *
N

'gradients/nce_loss/Slice_2_grad/ReshapeReshapence_loss/stack_2%gradients/nce_loss/Slice_2_grad/stack*
Tshape0*
T0
d
'gradients/nce_loss/Slice_2_grad/Shape_1Shapence_loss/embedding_lookup*
out_type0*
T0

#gradients/nce_loss/Slice_2_grad/subSub'gradients/nce_loss/Slice_2_grad/Shape_1%gradients/nce_loss/Slice_2_grad/Shape*
T0
l
%gradients/nce_loss/Slice_2_grad/sub_1Sub#gradients/nce_loss/Slice_2_grad/subnce_loss/stack_2*
T0

)gradients/nce_loss/Slice_2_grad/Reshape_1Reshape%gradients/nce_loss/Slice_2_grad/sub_1%gradients/nce_loss/Slice_2_grad/stack*
Tshape0*
T0
U
+gradients/nce_loss/Slice_2_grad/concat/axisConst*
value	B :*
dtype0
Ń
&gradients/nce_loss/Slice_2_grad/concatConcatV2'gradients/nce_loss/Slice_2_grad/Reshape)gradients/nce_loss/Slice_2_grad/Reshape_1+gradients/nce_loss/Slice_2_grad/concat/axis*

Tidx0*
T0*
N
©
#gradients/nce_loss/Slice_2_grad/PadPad;gradients/nce_loss/MatMul_1_grad/tuple/control_dependency_1&gradients/nce_loss/Slice_2_grad/concat*
	Tpaddings0*
T0

%gradients/nce_loss/MatMul_grad/MatMulMatMul)gradients/nce_loss/Reshape_3_grad/Reshapence_loss/ones*
transpose_b(*
transpose_a( *
T0

'gradients/nce_loss/MatMul_grad/MatMul_1MatMulnce_loss/Reshape_2)gradients/nce_loss/Reshape_3_grad/Reshape*
transpose_b( *
T0*
transpose_a(

/gradients/nce_loss/MatMul_grad/tuple/group_depsNoOp&^gradients/nce_loss/MatMul_grad/MatMul(^gradients/nce_loss/MatMul_grad/MatMul_1
ß
7gradients/nce_loss/MatMul_grad/tuple/control_dependencyIdentity%gradients/nce_loss/MatMul_grad/MatMul0^gradients/nce_loss/MatMul_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients/nce_loss/MatMul_grad/MatMul
å
9gradients/nce_loss/MatMul_grad/tuple/control_dependency_1Identity'gradients/nce_loss/MatMul_grad/MatMul_10^gradients/nce_loss/MatMul_grad/tuple/group_deps*:
_class0
.,loc:@gradients/nce_loss/MatMul_grad/MatMul_1*
T0
¬
gradients/AddN_1AddN#gradients/nce_loss/Slice_3_grad/Pad#gradients/nce_loss/Slice_1_grad/Pad*
T0*6
_class,
*(loc:@gradients/nce_loss/Slice_3_grad/Pad*
N

0gradients/nce_loss/embedding_lookup_1_grad/ShapeConst*
_class
loc:@nce_biases*
valueB:Š*
dtype0
a
/gradients/nce_loss/embedding_lookup_1_grad/SizeSizence_loss/concat*
out_type0*
T0	
c
9gradients/nce_loss/embedding_lookup_1_grad/ExpandDims/dimConst*
value	B : *
dtype0
Ä
5gradients/nce_loss/embedding_lookup_1_grad/ExpandDims
ExpandDims/gradients/nce_loss/embedding_lookup_1_grad/Size9gradients/nce_loss/embedding_lookup_1_grad/ExpandDims/dim*
T0*

Tdim0
l
>gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stackConst*
valueB:*
dtype0
n
@gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1Const*
dtype0*
valueB: 
n
@gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2Const*
dtype0*
valueB:
ø
8gradients/nce_loss/embedding_lookup_1_grad/strided_sliceStridedSlice0gradients/nce_loss/embedding_lookup_1_grad/Shape>gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stack@gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stack_1@gradients/nce_loss/embedding_lookup_1_grad/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask 
`
6gradients/nce_loss/embedding_lookup_1_grad/concat/axisConst*
dtype0*
value	B : 

1gradients/nce_loss/embedding_lookup_1_grad/concatConcatV25gradients/nce_loss/embedding_lookup_1_grad/ExpandDims8gradients/nce_loss/embedding_lookup_1_grad/strided_slice6gradients/nce_loss/embedding_lookup_1_grad/concat/axis*
N*
T0*

Tidx0

2gradients/nce_loss/embedding_lookup_1_grad/ReshapeReshapegradients/AddN_11gradients/nce_loss/embedding_lookup_1_grad/concat*
Tshape0*
T0

4gradients/nce_loss/embedding_lookup_1_grad/Reshape_1Reshapence_loss/concat5gradients/nce_loss/embedding_lookup_1_grad/ExpandDims*
T0	*
Tshape0
W
"gradients/nce_loss/ones_grad/ConstConst*
valueB"       *
dtype0
¬
 gradients/nce_loss/ones_grad/SumSum9gradients/nce_loss/MatMul_grad/tuple/control_dependency_1"gradients/nce_loss/ones_grad/Const*
T0*

Tidx0*
	keep_dims( 
W
'gradients/nce_loss/Reshape_2_grad/ShapeShapence_loss/Mul*
T0*
out_type0
­
)gradients/nce_loss/Reshape_2_grad/ReshapeReshape7gradients/nce_loss/MatMul_grad/tuple/control_dependency'gradients/nce_loss/Reshape_2_grad/Shape*
Tshape0*
T0
X
!gradients/nce_loss/Mul_grad/ShapeShapence_loss/ExpandDims*
out_type0*
T0
Y
#gradients/nce_loss/Mul_grad/Shape_1Shapence_loss/Reshape_1*
out_type0*
T0

1gradients/nce_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs!gradients/nce_loss/Mul_grad/Shape#gradients/nce_loss/Mul_grad/Shape_1*
T0
n
gradients/nce_loss/Mul_grad/mulMul)gradients/nce_loss/Reshape_2_grad/Reshapence_loss/Reshape_1*
T0
 
gradients/nce_loss/Mul_grad/SumSumgradients/nce_loss/Mul_grad/mul1gradients/nce_loss/Mul_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 

#gradients/nce_loss/Mul_grad/ReshapeReshapegradients/nce_loss/Mul_grad/Sum!gradients/nce_loss/Mul_grad/Shape*
Tshape0*
T0
q
!gradients/nce_loss/Mul_grad/mul_1Mulnce_loss/ExpandDims)gradients/nce_loss/Reshape_2_grad/Reshape*
T0
¦
!gradients/nce_loss/Mul_grad/Sum_1Sum!gradients/nce_loss/Mul_grad/mul_13gradients/nce_loss/Mul_grad/BroadcastGradientArgs:1*
T0*

Tidx0*
	keep_dims( 

%gradients/nce_loss/Mul_grad/Reshape_1Reshape!gradients/nce_loss/Mul_grad/Sum_1#gradients/nce_loss/Mul_grad/Shape_1*
Tshape0*
T0

,gradients/nce_loss/Mul_grad/tuple/group_depsNoOp$^gradients/nce_loss/Mul_grad/Reshape&^gradients/nce_loss/Mul_grad/Reshape_1
Õ
4gradients/nce_loss/Mul_grad/tuple/control_dependencyIdentity#gradients/nce_loss/Mul_grad/Reshape-^gradients/nce_loss/Mul_grad/tuple/group_deps*6
_class,
*(loc:@gradients/nce_loss/Mul_grad/Reshape*
T0
Ū
6gradients/nce_loss/Mul_grad/tuple/control_dependency_1Identity%gradients/nce_loss/Mul_grad/Reshape_1-^gradients/nce_loss/Mul_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients/nce_loss/Mul_grad/Reshape_1
\
(gradients/nce_loss/ExpandDims_grad/ShapeShapeembedding_lookup*
T0*
out_type0
¬
*gradients/nce_loss/ExpandDims_grad/ReshapeReshape4gradients/nce_loss/Mul_grad/tuple/control_dependency(gradients/nce_loss/ExpandDims_grad/Shape*
T0*
Tshape0
Y
'gradients/nce_loss/Reshape_1_grad/ShapeShapence_loss/Slice*
T0*
out_type0
¬
)gradients/nce_loss/Reshape_1_grad/ReshapeReshape6gradients/nce_loss/Mul_grad/tuple/control_dependency_1'gradients/nce_loss/Reshape_1_grad/Shape*
T0*
Tshape0
Ķ
gradients/AddN_2AddN9gradients/nce_loss/MatMul_1_grad/tuple/control_dependency*gradients/nce_loss/ExpandDims_grad/Reshape*
N*:
_class0
.,loc:@gradients/nce_loss/MatMul_1_grad/MatMul*
T0
x
%gradients/embedding_lookup_grad/ShapeConst*
dtype0*
_class
loc:@embedding*
valueB"PĆ     
U
$gradients/embedding_lookup_grad/SizeSizetrain_examples*
T0*
out_type0
X
.gradients/embedding_lookup_grad/ExpandDims/dimConst*
dtype0*
value	B : 
£
*gradients/embedding_lookup_grad/ExpandDims
ExpandDims$gradients/embedding_lookup_grad/Size.gradients/embedding_lookup_grad/ExpandDims/dim*
T0*

Tdim0
a
3gradients/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
valueB:
c
5gradients/embedding_lookup_grad/strided_slice/stack_1Const*
valueB: *
dtype0
c
5gradients/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
valueB:

-gradients/embedding_lookup_grad/strided_sliceStridedSlice%gradients/embedding_lookup_grad/Shape3gradients/embedding_lookup_grad/strided_slice/stack5gradients/embedding_lookup_grad/strided_slice/stack_15gradients/embedding_lookup_grad/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask *

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask
U
+gradients/embedding_lookup_grad/concat/axisConst*
value	B : *
dtype0
Ų
&gradients/embedding_lookup_grad/concatConcatV2*gradients/embedding_lookup_grad/ExpandDims-gradients/embedding_lookup_grad/strided_slice+gradients/embedding_lookup_grad/concat/axis*
N*
T0*

Tidx0

'gradients/embedding_lookup_grad/ReshapeReshapegradients/AddN_2&gradients/embedding_lookup_grad/concat*
Tshape0*
T0

)gradients/embedding_lookup_grad/Reshape_1Reshapetrain_examples*gradients/embedding_lookup_grad/ExpandDims*
Tshape0*
T0
L
"gradients/nce_loss/Slice_grad/RankConst*
value	B :*
dtype0
U
#gradients/nce_loss/Slice_grad/ShapeShapence_loss/Slice*
T0*
out_type0
O
%gradients/nce_loss/Slice_grad/stack/1Const*
dtype0*
value	B :

#gradients/nce_loss/Slice_grad/stackPack"gradients/nce_loss/Slice_grad/Rank%gradients/nce_loss/Slice_grad/stack/1*

axis *
T0*
N

%gradients/nce_loss/Slice_grad/ReshapeReshapence_loss/Slice/begin#gradients/nce_loss/Slice_grad/stack*
T0*
Tshape0
b
%gradients/nce_loss/Slice_grad/Shape_1Shapence_loss/embedding_lookup*
T0*
out_type0
}
!gradients/nce_loss/Slice_grad/subSub%gradients/nce_loss/Slice_grad/Shape_1#gradients/nce_loss/Slice_grad/Shape*
T0
l
#gradients/nce_loss/Slice_grad/sub_1Sub!gradients/nce_loss/Slice_grad/subnce_loss/Slice/begin*
T0

'gradients/nce_loss/Slice_grad/Reshape_1Reshape#gradients/nce_loss/Slice_grad/sub_1#gradients/nce_loss/Slice_grad/stack*
Tshape0*
T0
S
)gradients/nce_loss/Slice_grad/concat/axisConst*
value	B :*
dtype0
É
$gradients/nce_loss/Slice_grad/concatConcatV2%gradients/nce_loss/Slice_grad/Reshape'gradients/nce_loss/Slice_grad/Reshape_1)gradients/nce_loss/Slice_grad/concat/axis*

Tidx0*
T0*
N

!gradients/nce_loss/Slice_grad/PadPad)gradients/nce_loss/Reshape_1_grad/Reshape$gradients/nce_loss/Slice_grad/concat*
	Tpaddings0*
T0
Ŗ
gradients/AddN_3AddN#gradients/nce_loss/Slice_2_grad/Pad!gradients/nce_loss/Slice_grad/Pad*6
_class,
*(loc:@gradients/nce_loss/Slice_2_grad/Pad*
T0*
N

.gradients/nce_loss/embedding_lookup_grad/ShapeConst*
dtype0*
_class
loc:@nce_weights*
valueB"PĆ     
_
-gradients/nce_loss/embedding_lookup_grad/SizeSizence_loss/concat*
out_type0*
T0	
a
7gradients/nce_loss/embedding_lookup_grad/ExpandDims/dimConst*
value	B : *
dtype0
¾
3gradients/nce_loss/embedding_lookup_grad/ExpandDims
ExpandDims-gradients/nce_loss/embedding_lookup_grad/Size7gradients/nce_loss/embedding_lookup_grad/ExpandDims/dim*
T0*

Tdim0
j
<gradients/nce_loss/embedding_lookup_grad/strided_slice/stackConst*
dtype0*
valueB:
l
>gradients/nce_loss/embedding_lookup_grad/strided_slice/stack_1Const*
dtype0*
valueB: 
l
>gradients/nce_loss/embedding_lookup_grad/strided_slice/stack_2Const*
dtype0*
valueB:
®
6gradients/nce_loss/embedding_lookup_grad/strided_sliceStridedSlice.gradients/nce_loss/embedding_lookup_grad/Shape<gradients/nce_loss/embedding_lookup_grad/strided_slice/stack>gradients/nce_loss/embedding_lookup_grad/strided_slice/stack_1>gradients/nce_loss/embedding_lookup_grad/strided_slice/stack_2*

begin_mask *
ellipsis_mask *
end_mask*
T0*
Index0*
shrink_axis_mask *
new_axis_mask 
^
4gradients/nce_loss/embedding_lookup_grad/concat/axisConst*
value	B : *
dtype0
ü
/gradients/nce_loss/embedding_lookup_grad/concatConcatV23gradients/nce_loss/embedding_lookup_grad/ExpandDims6gradients/nce_loss/embedding_lookup_grad/strided_slice4gradients/nce_loss/embedding_lookup_grad/concat/axis*
N*
T0*

Tidx0

0gradients/nce_loss/embedding_lookup_grad/ReshapeReshapegradients/AddN_3/gradients/nce_loss/embedding_lookup_grad/concat*
T0*
Tshape0

2gradients/nce_loss/embedding_lookup_grad/Reshape_1Reshapence_loss/concat3gradients/nce_loss/embedding_lookup_grad/ExpandDims*
Tshape0*
T0	
C
train_op/learning_rateConst*
valueB
 *  ?*
dtype0

train_op/update_embedding/mulMul'gradients/embedding_lookup_grad/Reshapetrain_op/learning_rate*
T0*
_class
loc:@embedding
Ń
$train_op/update_embedding/ScatterSub
ScatterSub	embedding)gradients/embedding_lookup_grad/Reshape_1train_op/update_embedding/mul*
_class
loc:@embedding*
T0*
Tindices0*
use_locking( 

train_op/update_nce_weights/mulMul0gradients/nce_loss/embedding_lookup_grad/Reshapetrain_op/learning_rate*
_class
loc:@nce_weights*
T0
ā
&train_op/update_nce_weights/ScatterSub
ScatterSubnce_weights2gradients/nce_loss/embedding_lookup_grad/Reshape_1train_op/update_nce_weights/mul*
_class
loc:@nce_weights*
T0*
Tindices0	*
use_locking( 

train_op/update_nce_biases/mulMul2gradients/nce_loss/embedding_lookup_1_grad/Reshapetrain_op/learning_rate*
_class
loc:@nce_biases*
T0
ą
%train_op/update_nce_biases/ScatterSub
ScatterSub
nce_biases4gradients/nce_loss/embedding_lookup_1_grad/Reshape_1train_op/update_nce_biases/mul*
_class
loc:@nce_biases*
T0*
Tindices0	*
use_locking( 

train_opNoOp%^train_op/update_embedding/ScatterSub'^train_op/update_nce_weights/ScatterSub&^train_op/update_nce_biases/ScatterSub
)
SquareSquareembedding/read*
T0
?
Sum/reduction_indicesConst*
dtype0*
value	B :
O
SumSumSquareSum/reduction_indices*
T0*

Tidx0*
	keep_dims(

SqrtSqrtSum*
T0
?
normalized_embeddingsRealDivembedding/readSqrt*
T0

embedding_lookup_1Gathernormalized_embeddingsinput*(
_class
loc:@normalized_embeddings*
validate_indices(*
Tparams0*
Tindices0
n

similarityMatMulembedding_lookup_1normalized_embeddings*
transpose_b(*
transpose_a( *
T0
H
initNoOp^embedding/Assign^nce_weights/Assign^nce_biases/Assign"