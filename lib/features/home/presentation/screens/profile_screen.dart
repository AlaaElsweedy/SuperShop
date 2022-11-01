import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_button.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/core/utils/styles/app_colors.dart';
import 'package:supershop/features/home/presentation/controllers/profile/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.getProfileState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            var profile = state.getProfile!.getProfileData;
            var image = state.getProfile!.getProfileData.image;
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 88,
                            backgroundColor: AppColors.primaryColorLight,
                            child: CircleAvatar(
                              radius: 84,
                              backgroundColor: AppColors.backgroundColorLight,
                              child: CircleAvatar(
                                radius: 80,
                                child: CachedNetworkImage(
                                  imageUrl: image,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 1.5,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: AppColors.primaryColorLight,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 80,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey[50],
                              child: IconButton(
                                splashRadius: 22,
                                onPressed: () {},
                                icon: const Icon(Icons.camera),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          profile.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        profile.email,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        title: 'Logout',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );

          case RequestState.error:
            return ShowError(networkExceptions: state.getProfileErrorMessage!);
        }
      },
    );
  }
}
