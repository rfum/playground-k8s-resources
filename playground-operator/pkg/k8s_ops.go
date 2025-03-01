package pkg

import (
	"context"
	"fmt"

	batchv1 "k8s.io/api/batch/v1"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	client "sigs.k8s.io/controller-runtime/pkg/client"
)

type JobMetadata struct {
	Namespace     string
	Name          string
	Image         string
	ContainerName string
	Command       string
}

func CreateJob(ctx context.Context, client client.Client, jobMeta *JobMetadata) error {
	job := &batchv1.Job{
		ObjectMeta: metav1.ObjectMeta{
			Name:      jobMeta.Name,
			Namespace: jobMeta.Namespace,
		},
		Spec: batchv1.JobSpec{
			Template: corev1.PodTemplateSpec{
				Spec: corev1.PodSpec{
					RestartPolicy: corev1.RestartPolicyNever,
					Containers: []corev1.Container{
						{
							Name:    jobMeta.ContainerName,
							Image:   jobMeta.Image,
							Command: []string{jobMeta.Command},
						},
					},
				},
			},
		},
	}

	if err := client.Create(ctx, job); err != nil {
		return fmt.Errorf("unable to create job: %v", err)
	}

	fmt.Println("Job created successfully!")
	return nil
}
