import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_responsive/config/palette.dart';
import 'package:flutter_facebook_ui_responsive/models/models.dart';
import 'package:flutter_facebook_ui_responsive/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDestop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: isDesktop ? 5.0 : 0.0,
        vertical: 5.0,
      ),
      elevation: isDesktop ? 5.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 4.0),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      color: Colors.amber,
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvater(imagUrl: post.user.imageUrl),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} .",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: "like",
              onTap: () {
                print("Like");
              },
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: "comment",
              onTap: () {
                print("comment");
              },
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: "share",
              onTap: () {
                print("share");
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const _PostButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 25.0,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 4.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}
