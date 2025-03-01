package controller

import (
	"context"

	"k8s.io/apimachinery/pkg/runtime"
	ctrl "sigs.k8s.io/controller-runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/log"

	playgroundv1alpha1 "github.com/rfum/playground-k8s-resources/api/v1alpha1"
	"github.com/rfum/playground-k8s-resources/pkg"
)

// PlaygroundReconciler reconciles a Playground object
type PlaygroundReconciler struct {
	client.Client
	Scheme *runtime.Scheme
}

//+kubebuilder:rbac:groups=playground.rfum.no,resources=playgrounds,verbs=get;list;watch;create;update;patch;delete
//+kubebuilder:rbac:groups=playground.rfum.no,resources=playgrounds/status,verbs=get;update;patch
//+kubebuilder:rbac:groups=playground.rfum.no,resources=playgrounds/finalizers,verbs=update

// Reconcile is part of the main kubernetes reconciliation loop which aims to
// move the current state of the cluster closer to the desired state.
// TODO(user): Modify the Reconcile function to compare the state specified by
// the Playground object against the actual cluster state, and then
// perform operations to make the cluster state reflect the state specified by
// the user.
//
// For more details, check Reconcile and its Result here:
// - https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.17.3/pkg/reconcile
func (r *PlaygroundReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
	_ = log.FromContext(ctx)

	// get the playground cr
	var playground playgroundv1alpha1.Playground
	if err := r.Get(ctx, req.NamespacedName, &playground); err != nil {
		return ctrl.Result{}, client.IgnoreNotFound(err)
	}

	// check services to be installed based on playground cr spec
	if playground.Spec.Longhorn {
		job := pkg.JobMetadata{Name: "longhorn", Namespace: "longhorn", ContainerName: "longhorn-install", Command: "tbd", Image: "tbd"}
		pkg.CreateJob(ctx, r.Client, &job)
	}

	if playground.Spec.Argocd {
		job := pkg.JobMetadata{Name: "argocd", Namespace: "argocd", ContainerName: "argocd-install", Command: "tbd", Image: "tbd"}
		pkg.CreateJob(ctx, r.Client, &job)
	}

	return ctrl.Result{}, nil
}

// SetupWithManager sets up the controller with the Manager.
func (r *PlaygroundReconciler) SetupWithManager(mgr ctrl.Manager) error {
	return ctrl.NewControllerManagedBy(mgr).
		For(&playgroundv1alpha1.Playground{}).
		Complete(r)
}
